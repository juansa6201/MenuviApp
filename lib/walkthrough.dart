import 'package:flutter/material.dart';
import 'package:menuvi_app/database.dart';


class Walkthrough extends StatefulWidget {
  final String day;
  Walkthrough(this.day);
  @override
  WalkthroughState createState() {
    return WalkthroughState(this.day);
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  final String final_day;
  WalkthroughState(this.final_day);
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(20),
      child: Material(
        color: Theme.of(context).primaryColor,
        animationDuration: Duration(milliseconds: 300),
        elevation: 1,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Database().daySelector(final_day),

        ],
        ),
      ),
    );
  }
}
