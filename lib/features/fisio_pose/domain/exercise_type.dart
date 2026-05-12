enum ExerciseType {
  squat,
  pushUp,
  plank,
}

extension ExerciseInfo on ExerciseType {
  String get title {
    switch (this) {
      case ExerciseType.squat:
        return "Agachamento";
      case ExerciseType.pushUp:
        return "Flexão de braço";
      case ExerciseType.plank:
        return "Prancha";
    }
  }
}
