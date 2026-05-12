import 'package:flutter/material.dart';

class PosePainter extends CustomPainter {
  final List<double>? landmarks;

  PosePainter(this.landmarks);

  @override
  void paint(Canvas canvas, Size size) {
    if (landmarks == null) return;

    final paintPoint = Paint()
      ..color = Colors.green
      ..strokeWidth = 6
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.green
      ..strokeWidth = 4;

    Offset point(int index) {
      final double x = landmarks![index * 3];
      final double y = landmarks![index * 3 + 1];

      // 1️⃣ Rotaciona -90° (landscape -> portrait)
      double rotatedX = y;
      double rotatedY = x;

      // 2️⃣ Espelha horizontal (front camera mirror)
      rotatedX = 1 - rotatedX;

      return Offset(rotatedX * size.width, rotatedY * size.height);
    }

    // desenhar pontos (33 landmarks)
    for (int i = 0; i < 33; i++) {
      canvas.drawCircle(point(i), 5, paintPoint);
    }

    // conexões principais do corpo (MediaPipe)
    void connect(int a, int b) {
      canvas.drawLine(point(a), point(b), paintLine);
    }

    // Tronco
    connect(11, 12);
    connect(11, 23);
    connect(12, 24);
    connect(23, 24);

    // Braços
    connect(11, 13);
    connect(13, 15);
    connect(12, 14);
    connect(14, 16);

    // Pernas
    connect(23, 25);
    connect(25, 27);
    connect(24, 26);
    connect(26, 28);
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.landmarks != landmarks;
  }
}
