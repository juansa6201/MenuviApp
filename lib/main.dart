import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:menuvi_app/tabs/first.dart';
import 'package:menuvi_app/tabs/second.dart';
import 'package:menuvi_app/tabs/third.dart';

Future<void> main() async{
  debugPaintSizeEnabled=false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Menuvi",
      home: new MyHome(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal[800],
        accentColor: Colors.teal[400],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          subtitle: TextStyle(fontSize: 25.0),
          body1: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menuvi"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: TabBarView(
          children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        child: new TabBar(
          labelColor: Theme.of(context).accentColor,
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.restaurant),
            ),
            new Tab(
              icon: new Icon(Icons.calendar_today),
            ),
            new Tab(
              icon: new Icon(Icons.settings),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}