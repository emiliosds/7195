import 'package:eggs/pages/settings.page.dart';
import 'package:eggs/widgets/action-buttons.widget.dart';
import 'package:eggs/widgets/eggs.widget.dart';
import 'package:eggs/widgets/progress.widget.dart';
import 'package:eggs/widgets/type-buttons.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
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
            Eggs(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),
              child: TypeButtons(),
            ),
            Progress(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ActionButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
