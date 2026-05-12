import 'dart:math';

class PushUpAnalyzer {
  bool _down = false;
  int reps = 0;

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
    final elbow = [lm[13 * 3], lm[13 * 3 + 1]];
    final wrist = [lm[15 * 3], lm[15 * 3 + 1]];

    final elbowAngle = _angle(shoulder, elbow, wrist);

    // DESCENDO
    if (elbowAngle < 90) {
      _down = true;
      return "Desceu 👍";
    }

    // SUBINDO → conta repetição
    if (elbowAngle > 160 && _down) {
      reps++;
      _down = false;
      return "Flexão válida! 🔥 Reps: $reps";
    }

    return "Continue...";
  }
}
