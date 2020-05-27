import 'package:eggs/models/theme.option.dart';
import 'package:eggs/widgets/select.theme.widget.dart';
import 'package:flutter/material.dart';

class ThemeControll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Theme",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 22,
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Select theme",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SelectTheme(),
                    actions: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: Text("Cancel"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FlatButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text("Ok"),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ).then(
                (value) => {
                  if (value) {print("Save theme")}
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 85,
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
                  "O",
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
}
