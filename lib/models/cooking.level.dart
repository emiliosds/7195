enum CookingLevel {
  soft,
  medium,
  hard,
}

extension CookingLevelExtension on CookingLevel {
  double get defaultValue {
    switch (this) {
      case CookingLevel.soft:
        return 10.0;
      case CookingLevel.medium:
        return 20.0;
      case CookingLevel.hard:
        return 30.0;
      default:
        return 1.0;
    }
  }

  String get name {
    switch (this) {
      case CookingLevel.soft:
        return "Soft";
      case CookingLevel.medium:
        return "Medium";
      case CookingLevel.hard:
        return "Hard";
      default:
        return "";
    }
  }
}
