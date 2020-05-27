import 'package:eggs/models/cooking.level.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceBloc extends ChangeNotifier {
  setup() async {
    _createLevelIfNotExist(CookingLevel.soft, 10.0);
    _createLevelIfNotExist(CookingLevel.medium, 20.0);
    _createLevelIfNotExist(CookingLevel.hard, 30.0);
    _createThemeIfNotExist("dark");
  }

  Future _createLevelIfNotExist(level, double defaultMinutes) async {
    var preferences = await SharedPreferences.getInstance();
    var contain = preferences.containsKey(level.toString());
    if (!contain) {
      await preferences.setDouble(level.toString(), defaultMinutes);
    }
  }

  Future _createThemeIfNotExist(defaulTheme) async {
    var preferences = await SharedPreferences.getInstance();
    var contain = preferences.containsKey("AppTheme");
    if (!contain) {
      await preferences.setString("AppTheme", defaulTheme);
    }
  }

  reset() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.remove(CookingLevel.soft.toString());
    await preferences.remove(CookingLevel.medium.toString());
    await preferences.remove(CookingLevel.hard.toString());
    await preferences.remove("AppTheme");
    await setup();
    notifyListeners();
  }
}
