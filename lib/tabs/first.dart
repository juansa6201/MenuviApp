import 'package:flutter/material.dart';
import 'package:menuvi_app/database.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting("es_ES");
    return new Container(
      child: DailyFood(),
    );
  }
}

class DailyFood extends StatefulWidget {
  @override
  DailyFoodState createState() => new DailyFoodState();
}

class DailyFoodState extends State<DailyFood>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: Database().daySelector(),
    );
  }
}
