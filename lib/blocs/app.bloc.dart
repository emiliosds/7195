import 'dart:async';
import 'package:flutter/material.dart';

class AppBloc extends ChangeNotifier {
  // O time é executado de segundo em segundo, pode ser
  // utilizado para criação de cronometros e/ou temporizadores
  Timer timer;
  String state = "stopped";
  String selected = "soft";
  double time = 0.5 * 60.0;
  double seconds = 0;
  double percent = 0;

  updateTime() {
    seconds++;
    percent = (seconds * 100) / time;
    notifyListeners();
    if (seconds == time) done();
  }

  select(String type) {
    switch (type) {
      case "soft":
        {
          selected = "soft";
          time = 0.5 * 60.0;
          notifyListeners();
          return;
        }
      case "medium":
        {
          selected = "medium";
          time = 1.0 * 60.0;
          notifyListeners();
          return;
        }
      case "hard":
        {
          selected = "hard";
          time = 1.5 * 60.0;
          notifyListeners();
          return;
        }
      default:
        {
          selected = "soft";
          time = 0.5 * 60.0;
          notifyListeners();
          return;
        }
    }
  }

  start() {
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
}
