import 'package:eggs/blocs/app.bloc.dart';
import 'package:eggs/blocs/preference.bloc.dart';
import 'package:eggs/pages/splash.page.dart';
import 'package:eggs/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// O provider precisa vir antes de qualquer coisa na aplicação,
// antes mesmo do MaterialApp, por isso a criação do MyApp e do Main

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppBloc>.value(
          value: AppBloc(),
        ),
        ChangeNotifierProvider<PreferenceBloc>.value(
          value: PreferenceBloc(),
        )
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfect Eggs',
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
