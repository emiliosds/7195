import 'package:eggs/models/theme.option.dart';
import 'package:flutter/material.dart';

class SelectTheme extends StatefulWidget {
  @override
  _SelectThemeState createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  ThemeOption _theme = ThemeOption.light;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      child: Column(
        children: <Widget>[
          RadioListTile<ThemeOption>(
            title: Text(ThemeOption.dark.name),
            value: ThemeOption.dark,
            groupValue: _theme,
            onChanged: (ThemeOption value) {
              setState(() {
                _theme = value;
              });
            },
          ),
          RadioListTile<ThemeOption>(
            title: Text(ThemeOption.light.name),
            value: ThemeOption.light,
            groupValue: _theme,
            onChanged: (ThemeOption value) {
              setState(() {
                _theme = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
