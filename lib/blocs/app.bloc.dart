import 'dart:async';
import 'package:eggs/models/cooking.level.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc extends ChangeNotifier {
  // O time é executado de segundo em segundo, pode ser
  // utilizado para criação de cronometros e/ou temporizadores
  Timer timer;
  String state = "stopped";
  CookingLevel selected = CookingLevel.soft;
  double time = 1;
  double seconds = 0;
  double percent = 0;

  updateTime() {
    seconds++;
    percent = (seconds * 100) / time;
    notifyListeners();
    if (seconds == time) done();
  }

  select(CookingLevel level) {
    selected = level;
    notifyListeners();
    return;
  }

  start() {
    load();
    state = "cooking";
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer t) => updateTime(),
    );
    notifyListeners();
  }

  stop() {
    timer.cancel();
    state = "stopped";
    seconds = 0;
    percent = 0;
    notifyListeners();
  }

  done() {
    timer.cancel();
    state = "done";
    seconds = 0;
    percent = 0;
    notifyListeners();
  }

  reset() {
    stop();
  }

  Future load() async {
    var preferences = await SharedPreferences.getInstance();
    var data = preferences.getDouble(selected.toString());
    print(data);
    if (data == null) data = 1;
    time = data * 60.0;
  }
}
