import 'package:flutter/material.dart';
import 'package:menuvi_app/database.dart';

final Widget data = Database().daySelector();

class Walkthrough extends StatefulWidget {
  @override
  WalkthroughState createState() {
    return WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {

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
            data,
          ],
        ),
      ),
    );
  }
}
