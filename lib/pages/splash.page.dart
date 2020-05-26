import 'package:eggs/models/cooking.level.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setup();
    delay(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: FlareActor(
              "assets/animations/egg-cooking.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              isPaused: false,
              animation: 'start',
            ),
          ),
          Text(
            "Perfect Eggs",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  setup() {
    load(CookingLevel.soft, 10.0);
    load(CookingLevel.medium, 20.0);
    load(CookingLevel.hard, 30.0);
  }

  Future load(level, double minutes) async {
    var preferences = await SharedPreferences.getInstance();
    var contain = preferences.containsKey(level.toString());
    if (!contain) save(level.toString(), minutes);
  }

  save(level, double minutes) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setDouble(level, minutes);
  }

  reset() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.remove(CookingLevel.soft.toString());
    await preferences.remove(CookingLevel.medium.toString());
    await preferences.remove(CookingLevel.hard.toString());
  }

  Future delay(context) async {
    await new Future.delayed(
        new Duration(
          milliseconds: 3000,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }
}
