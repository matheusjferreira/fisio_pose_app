import 'dart:math';

class SquatAnalyzer {
  double _angle(List<double> a, List<double> b, List<double> c) {
    final ab = [a[0] - b[0], a[1] - b[1]];
    final cb = [c[0] - b[0], c[1] - b[1]];

    final dot = ab[0] * cb[0] + ab[1] * cb[1];
    final magAB = sqrt(ab[0] * ab[0] + ab[1] * ab[1]);
    final magCB = sqrt(cb[0] * cb[0] + cb[1] * cb[1]);

    return acos(dot / (magAB * magCB)) * 180 / pi;
  }

  String analyze(List<double> lm) {
    final hip = [lm[23 * 3], lm[23 * 3 + 1]];
    final knee = [lm[25 * 3], lm[25 * 3 + 1]];
    final ankle = [lm[27 * 3], lm[27 * 3 + 1]];

    final kneeAngle = _angle(hip, knee, ankle);

    if (kneeAngle < 90) {
      return "Agachamento correto ✅";
    } else {
      return "Desça mais ❌";
    }
  }
}
