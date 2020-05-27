import 'package:flutter/material.dart';

ThemeData lightTheme() {
  const brightness = Brightness.light;
  const primaryColor = const Color(0xFFb98d62);
  const accentColor = const Color(0xFF212121);

  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText2: new TextStyle(
        fontFamily: "Montserrat",
        //color: Colors.black54,
      ),
      bodyText1: TextStyle(
        fontFamily: "Montserrat",
      ),
      button: TextStyle(
        fontFamily: "Montserrat",
      ),
      caption: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline4: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline3: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline2: TextStyle(
        fontFamily: "Montserrat",
        //color: Colors.black26,
      ),
      headline1: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline5: TextStyle(
        fontFamily: "Montserrat",
      ),
      overline: TextStyle(
        fontFamily: "Montserrat",
      ),
      subtitle1: TextStyle(
        fontFamily: "Montserrat",
        //color: Colors.black54,
      ),
      subtitle2: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline6: TextStyle(
        fontFamily: "Montserrat",
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
  );
}

ThemeData darkTheme() {
  const brightness = Brightness.dark;
  const primaryColor = const Color(0xFFFDBF00);
  const accentColor = const Color(0xFFFFFFFF);

  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText2: new TextStyle(
        fontFamily: "Montserrat",
        color: Colors.black87,
      ),
      bodyText1: TextStyle(
        fontFamily: "Montserrat",
      ),
      button: TextStyle(
        fontFamily: "Montserrat",
      ),
      caption: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline4: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline3: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline2: TextStyle(
        fontFamily: "Montserrat",
        color: Colors.black38,
      ),
      headline1: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline5: TextStyle(
        fontFamily: "Montserrat",
      ),
      overline: TextStyle(
        fontFamily: "Montserrat",
      ),
      subtitle1: TextStyle(
        fontFamily: "Montserrat",
        color: Colors.black87,
      ),
      subtitle2: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline6: TextStyle(
        fontFamily: "Montserrat",
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
  );
}
