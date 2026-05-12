package com.example.fisio_pose_app

import android.content.Context
import android.graphics.Bitmap
import com.google.mediapipe.framework.image.BitmapImageBuilder
import com.google.mediapipe.tasks.core.BaseOptions
import com.google.mediapipe.tasks.vision.core.RunningMode
import com.google.mediapipe.tasks.vision.poselandmarker.PoseLandmarker
import com.google.mediapipe.tasks.vision.poselandmarker.PoseLandmarker.PoseLandmarkerOptions

class PoseDetector(context: Context) {

    private val poseLandmarker: PoseLandmarker

    init {
        val baseOptions = BaseOptions.builder()
            .setModelAssetPath("pose_landmarker_lite.task")
            .build()

        val options = PoseLandmarkerOptions.builder()
            .setBaseOptions(baseOptions)
            .setRunningMode(RunningMode.IMAGE)
            .build()

        poseLandmarker = PoseLandmarker.createFromOptions(context, options)
    }

    fun detect(bitmap: Bitmap): List<Float>? {
        val mpImage = BitmapImageBuilder(bitmap).build()
        val result = poseLandmarker.detect(mpImage)

        if (result.landmarks().isEmpty()) return null

        val landmarks = result.landmarks()[0]
        val list = mutableListOf<Float>()

        for (lm in landmarks) {
            list.add(lm.x())
            list.add(lm.y())
            list.add(lm.z())
        }

        return list
    }
}
