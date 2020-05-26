import 'package:eggs/blocs/app.bloc.dart';
import 'package:eggs/models/cooking.level.dart';
import 'package:eggs/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);
    return bloc.state == "stopped" ? buttons(bloc) : SizedBox();
  }

  Widget buttons(bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Button(
          label: "Soft",
          selected: bloc.selected == CookingLevel.soft,
          callback: () {
            bloc.select(CookingLevel.soft);
          },
        ),
        Button(
          label: "Medium",
          selected: bloc.selected == CookingLevel.medium,
          callback: () {
            bloc.select(CookingLevel.medium);
          },
        ),
        Button(
          label: "Hard",
          selected: bloc.selected == CookingLevel.hard,
          callback: () {
            bloc.select(CookingLevel.hard);
          },
        ),
      ],
    );
  }
}
