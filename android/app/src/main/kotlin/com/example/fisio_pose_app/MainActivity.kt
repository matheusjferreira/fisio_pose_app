package com.example.fisio_pose_app

import android.graphics.*
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

class MainActivity: FlutterActivity() {
    private val CHANNEL = "pose_channel"
    private lateinit var detector: PoseDetector

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        detector = PoseDetector(this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        .setMethodCallHandler { call, result ->

            if (call.method == "processFrame") {

                val bytes = call.argument<ByteArray>("bytes")

                if (bytes == null) {
                    result.success(null)
                    return@setMethodCallHandler
                }

                val bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size)

                if (bitmap == null) {
                    result.success(null)
                    return@setMethodCallHandler
                }

                val landmarks = detector.detect(bitmap)
                result.success(landmarks)
            }
        }
    }
}
