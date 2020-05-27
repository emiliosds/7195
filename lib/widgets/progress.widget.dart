import 'package:eggs/blocs/app.bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);

    return bloc.state == "cooking" ? progress(bloc, context) : SizedBox();
  }

  Widget progress(bloc, context) {
    return Column(
      children: <Widget>[
        Text(
          "${(bloc.time - bloc.seconds).round()} sec",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: LinearProgressIndicator(
            value: bloc.percent / 100,
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.1),
            valueColor: new AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
