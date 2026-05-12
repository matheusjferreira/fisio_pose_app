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

    if (bodyAngle > 170) {
      return "Prancha perfeita 🔥";
    } else if (bodyAngle > 150) {
      return "Suba um pouco o quadril ⚠️";
    } else {
      return "Quadril muito baixo ❌";
    }
  }
}
