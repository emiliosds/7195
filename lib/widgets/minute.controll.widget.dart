import 'package:eggs/blocs/preference.bloc.dart';
import 'package:eggs/models/cooking.level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MinuteControll extends StatefulWidget {
  final String label;
  final CookingLevel level;
  MinuteControll({@required this.label, @required this.level});

  @override
  _MinuteControllState createState() => _MinuteControllState();
}

class _MinuteControllState extends State<MinuteControll> {
  double _minutes = 0;

  @override
  Widget build(BuildContext context) {
    load();
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.label,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 22,
            ),
          ),
          GestureDetector(
            onTap: () async {
              Duration resultingDuration = await showDurationPicker(
                context: context,
                initialTime: new Duration(
                  minutes: _minutes.round(),
                ),
              );

              setState(() {
                if (resultingDuration != null) {
                  if (resultingDuration.inMinutes > 59)
                    _minutes = 59;
                  else if (resultingDuration.inMinutes < 1)
                    _minutes = 1;
                  else
                    _minutes = resultingDuration.inMinutes.toDouble();
                  save();
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 75,
              decoration: BoxDecoration(
                color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  _minutes.round().toString(),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  save() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setDouble(widget.level.toString(), _minutes);

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Saved",
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        duration: Duration(
          seconds: 2,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Future load() async {
    var preferences = await SharedPreferences.getInstance();
    var data = preferences.getDouble(widget.level.toString());
    if (data == null) data = 1;
    _minutes = data;
    setState(() {
      _minutes = data;
    });
  }
}
