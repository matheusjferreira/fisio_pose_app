import 'dart:developer';
import 'package:flutter/services.dart';

class PoseService {
  static const MethodChannel _channel = MethodChannel("pose_channel");

  Future<List<double>?> detect(Uint8List jpgBytes) async {
    try {
      final result = await _channel.invokeMethod("processFrame", {
        "bytes": jpgBytes,
      });

      if (result == null) return null;

      final List<dynamic> rawList = result as List<dynamic>;
      return rawList.map((e) => (e as num).toDouble()).toList();
    } catch (e) {
      log("ERRO detectPose: $e");
      return null;
    }
  }
}
