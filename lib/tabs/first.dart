import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("de_DE");
    return Container(
      child: new DailyFood(),
    );
  }
}

class DailyFood extends StatefulWidget {
  DailyFood({Key key}) : super(key: key);

  @override
  DailyFoodState createState() => new DailyFoodState();
}

class DailyFoodState extends State<DailyFood> {
  String principal = 'Cargando contenido';
  String opcion = 'Cargando opcion';

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
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Expanded(
                        child: new Text(principal,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline,
                            textAlign: TextAlign.center)),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                        child: new Text(opcion,
                            style: Theme
                                .of(context)
                                .textTheme
                                .title,
                            textAlign: TextAlign.center),
                    )
                  ],
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
