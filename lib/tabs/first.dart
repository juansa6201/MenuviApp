import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    DateTime date = DateTime.now();
    return Scaffold(
      body: Center(
        child: new DailyFood(),
      ),
    );
  }
}

class DailyFood extends StatefulWidget {
  DailyFood({Key key}) : super(key: key);

  @override
  DailyFoodState createState() => new DailyFoodState();
}

class DailyFoodState extends State<DailyFood> {
  //List<dynamic> principales = List();
  Text principales2 = Text("No hay valores");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: FirebaseDatabase.instance
              .reference()
              .child('lunes')
              .once()
              .then((DataSnapshot snapshot) {
            Map<dynamic, dynamic> values = snapshot.value;
            principales2 = Text(snapshot.value['principal'].toString());
            //Lists
            //values.forEach((key, value) {
              //print(snapshot.value['principal']);
              //principales.add(snapshot.value['principal']);
            //}
          }),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return new Column(
              children: <Widget>[
                principales2,
              ],
            );
          },
        )
    );
  }
}
