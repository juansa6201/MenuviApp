import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting("es_ES");
    return Container(
      child: new DailyFood(),
    );
  }
}

class VerticalPadding extends StatelessWidget {
  VerticalPadding({
    @required this.child,
    @required this.left,
    @required this.top,
    @required this.right,
    @required this.bottom,
    this.color = Colors.white,
  });

  final double left;
  final double top;
  final double right;
  final double bottom;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: child,
    );
  }
}

class DailyFood extends StatefulWidget {
  @override
  DailyFoodState createState() => new DailyFoodState();
}

class DailyFoodState extends State<DailyFood> {
  String principal = 'Cargando plato principal';
  String opcion = 'Cargando opcion';
  String p_1 = 'Cargando postre';
  String p_2 = 'Cargando postre';
  String p_3 = 'Cargando postre';
  String sopa = 'Cargando sopa';

  daySelector() {
    final DateTime date = DateTime.now();
    String formatted = new DateFormat('dd-MM').format(date);

    return new FutureBuilder(
      future: FirebaseDatabase.instance
          .reference()
          .child(formatted)
          .once()
          .then((DataSnapshot snapshot) {
        principal = snapshot.value['principal'].toString();
        opcion = snapshot.value['opcion'].toString();
        sopa = snapshot.value['sopa'].toString();
        p_1 = snapshot.value['p_1'].toString();
        p_2 = snapshot.value['p_2'].toString();
        p_3 = snapshot.value['p_3'].toString();
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return new Scaffold(
            body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VerticalPadding(
              child: new Text(principal,
                  style: Theme.of(context).textTheme.headline,
                  textAlign: TextAlign.center),
              bottom: 5,
              left: 10,
              right: 10,
              top: 0,

            ),
            VerticalPadding(
              child: new Text(opcion,
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center),
              bottom: 35,
              left: 15,
              right: 15,
              top: 15,
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(p_1,
                      style: Theme.of(context).textTheme.body1,
                      textAlign: TextAlign.center),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(p_2,
                      style: Theme.of(context).textTheme.body1,
                      textAlign: TextAlign.center),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Text(p_3,
                      style: Theme.of(context).textTheme.body1,
                      textAlign: TextAlign.center),
                )
              ],
            ),
            VerticalPadding(
              child: new Text(sopa,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center),
              top: 45,
              right: 0,
              left: 0,
              bottom: 0,
            ),
          ],
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: daySelector(),
    );
  }
}
