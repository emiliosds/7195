enum ThemeOption {
  light,
  dark,
}

extension ThemeOptionExtension on ThemeOption {
  String get name {
    switch (this) {
      case ThemeOption.dark:
        return "Dark";
      case ThemeOption.light:
        return "Light";
      default:
        return "";
    }
  }
}
