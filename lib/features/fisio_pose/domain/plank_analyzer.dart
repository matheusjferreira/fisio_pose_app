import 'dart:math';

class PlankAnalyzer {
  double _angle(List<double> a, List<double> b, List<double> c) {
    final ab = [a[0] - b[0], a[1] - b[1]];
    final cb = [c[0] - b[0], c[1] - b[1]];

    final dot = ab[0] * cb[0] + ab[1] * cb[1];
    final magAB = sqrt(ab[0] * ab[0] + ab[1] * ab[1]);
    final magCB = sqrt(cb[0] * cb[0] + cb[1] * cb[1]);

    return acos(dot / (magAB * magCB)) * 180 / pi;
  }

  String analyze(List<double> lm) {
    final shoulder = [lm[11 * 3], lm[11 * 3 + 1]];
    final hip = [lm[23 * 3], lm[23 * 3 + 1]];
    final ankle = [lm[27 * 3], lm[27 * 3 + 1]];

    final bodyAngle = _angle(shoulder, hip, ankle);

    // altura média entre ombro e tornozelo
    final midLineY = (shoulder[1] + ankle[1]) / 2;

    final hipY = hip[1];

    // diferença vertical do quadril
    final hipOffset = hipY - midLineY;

    // margem de tolerância
    const tolerance = 0.03;

    // Corpo alinhado
    if (bodyAngle > 170 && hipOffset.abs() < tolerance) {
      return "Prancha perfeita 🔥";
    }

    // Quadril baixo (afundando)
    if (hipOffset > tolerance) {
      return "Suba o quadril ⚠️";
    }

    // Quadril alto (empinado)
    if (hipOffset < -tolerance) {
      return "Desça o quadril ❌";
    }

    return "Alinhe o corpo 👍";
  }
}
