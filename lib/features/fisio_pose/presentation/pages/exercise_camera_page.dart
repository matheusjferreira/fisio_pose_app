import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/camera_image_converter.dart';
import '../../../../main.dart';
import '../../domain/push_up_analyzer.dart';
import '../../domain/exercise_type.dart';
import '../../domain/plank_analyzer.dart';
import '../../domain/squat_analyzer.dart';
import '../../services/pose_service.dart';
import '../painters/pose_painter.dart';

class ExerciseCameraPage extends StatefulWidget {
  final ExerciseType type;
  const ExerciseCameraPage(this.type, {super.key});

  @override
  State<ExerciseCameraPage> createState() => _ExerciseCameraPageState();
}

class _ExerciseCameraPageState extends State<ExerciseCameraPage> {
  late CameraController controller;
  final poseService = PoseService();

  String result = "Aponte a câmera";
  bool processing = false;
  bool disposed = false;
  List<double>? landmarks;

  dynamic analyzer;

  @override
  void initState() {
    super.initState();

    // Escolhe o analyzer
    switch (widget.type) {
      case ExerciseType.squat:
        analyzer = SquatAnalyzer();
        break;
      case ExerciseType.pushUp:
        analyzer = PushUpAnalyzer();
        break;
      case ExerciseType.plank:
        analyzer = PlankAnalyzer();
        break;
    }

    controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );

    controller.initialize().then((_) {
      controller.startImageStream(_processFrame);
      setState(() {});
    });
  }

  Future<void> _processFrame(CameraImage image) async {
    if (processing || disposed) return;
    processing = true;

    try {
      final jpegBytes = await convertCameraImage(image);
      final lm = await poseService.detect(jpegBytes);

      if (lm != null && mounted) {
        setState(() {
          result = analyzer.analyze(lm);
          landmarks = lm;
        });
      }
    } catch (e) {
      log("Erro: $e");
    }

    processing = false;
  }

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.type.title)),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CameraPreview(controller),
                Positioned.fill(
                  child: CustomPaint(painter: PosePainter(landmarks)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(result, style: const TextStyle(fontSize: 22)),
          ),
        ],
      ),
    );
  }
}
