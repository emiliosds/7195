import 'package:eggs/models/cooking.level.dart';
import 'package:eggs/models/theme.option.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceBloc extends ChangeNotifier {
  setup() async {
    _createLevelIfNotExist(CookingLevel.soft);
    _createLevelIfNotExist(CookingLevel.medium);
    _createLevelIfNotExist(CookingLevel.hard);
    _createThemeIfNotExist(ThemeOption.dark);
  }

  Future _createLevelIfNotExist(CookingLevel level) async {
    var preferences = await SharedPreferences.getInstance();
    var contain = preferences.containsKey(level.toString());
    if (!contain) {
      await preferences.setDouble(level.toString(), level.defaultValue);
    }
  }

  Future _createThemeIfNotExist(ThemeOption defaulTheme) async {
    var preferences = await SharedPreferences.getInstance();
    var contain = preferences.containsKey("ThemeOption");
    if (!contain) {
      await preferences.setString("ThemeOption", defaulTheme.name);
    }
  }

  reset() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.remove(CookingLevel.soft.toString());
    await preferences.remove(CookingLevel.medium.toString());
    await preferences.remove(CookingLevel.hard.toString());
    await preferences.remove("ThemeOption");
    await setup();
    notifyListeners();
  }
}
