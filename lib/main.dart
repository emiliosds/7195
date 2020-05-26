import 'package:eggs/pages/splash.page.dart';
import 'package:eggs/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfect Eggs',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
