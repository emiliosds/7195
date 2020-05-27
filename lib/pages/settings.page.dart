import 'package:eggs/blocs/preference.bloc.dart';
import 'package:eggs/models/cooking.level.dart';
import 'package:eggs/widgets/button.widget.dart';
import 'package:eggs/widgets/minute.controll.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PreferenceBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            MinuteControll(
              label: "Soft minutes",
              level: CookingLevel.soft,
            ),
            MinuteControll(
              label: "Medium minutes",
              level: CookingLevel.medium,
            ),
            MinuteControll(
              label: "Hard minutes",
              level: CookingLevel.hard,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              label: "RESET DEFAULT VALUES",
              selected: true,
              callback: bloc.reset,
            ),
          ],
        ),
      ),
    );
  }
}
