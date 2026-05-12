import 'package:flutter/material.dart';

import '../../domain/exercise_type.dart';
import 'exercise_camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget card(BuildContext context, ExerciseType type, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ExerciseCameraPage(type)),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Icon(icon, size: 40),
              const SizedBox(width: 20),
              Text(type.title, style: const TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fisio Pose MVP")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            card(context, ExerciseType.squat, Icons.accessibility_new),
            card(context, ExerciseType.pushUp, Icons.fitness_center),
            card(context, ExerciseType.plank, Icons.self_improvement),
          ],
        ),
      ),
    );
  }
}
