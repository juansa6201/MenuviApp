import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menuvi_app/tabs/first.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Menuvi",
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: new MyHome(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.teal[400],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          title: TextStyle(fontSize: 26, fontWeight: FontWeight.w300),
          body1: TextStyle(fontSize: 28),
          subtitle: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        title: new Text("MENUVI", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: new FirstTab(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}