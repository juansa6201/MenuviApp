import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Database {

  String principal = 'Plato principal';
  String opcion = 'Opcion';
  String p_1 = 'Postre n°1';
  String p_2 = 'Postre n°2';
  String p_3 = 'Postre n°3';
  String sopa = 'Sopa';

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
        return new Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                VerticalPadding(
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.restaurant, size: 60),
                      new Text(principal,
                          style: Theme.of(context).textTheme.headline,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  top: 0,
                  left: 10,
                  right: 10,
                  bottom: 15,
                ),
                VerticalPadding(
                  child: new Column(
                    children: <Widget>[
                      new Text(opcion,
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.center),
                    ],
                  ),
                  bottom: 0,
                  left: 15,
                  right: 15,
                  top: 0,
                ),
                VerticalPadding(
                  child: new Column(
                    children: <Widget>[
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
                    ],
                  ),
                  top: 10,
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                VerticalPadding(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.restaurant_menu, size: 40),
                      new Text(sopa,
                          style: Theme.of(context).textTheme.subtitle,
                          textAlign: TextAlign.center)
                    ],
                  ),
                  top: 25,
                  right: 0,
                  left: 0,
                  bottom: 0,
                ),
              ],
            ));
      },
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
  });

  final double left;
  final double top;
  final double right;
  final double bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: child,
    );
  }
}