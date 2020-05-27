import 'package:eggs/blocs/preference.bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PreferenceBloc>(context);
    bloc.setup();

    delay(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
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
