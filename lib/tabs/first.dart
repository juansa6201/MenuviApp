import 'package:flutter/material.dart';
import 'package:menuvi_app/database.dart';
import 'package:menuvi_app/walkthrough.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting("es_ES");
    return new Container(
      child: DailyFood(),
      color: Theme.of(context).primaryColor,
    );
  }
}

class DailyFood extends StatefulWidget {
  @override
  DailyFoodState createState() => new DailyFoodState();
}

class DailyFoodState extends State<DailyFood> {
  final Widget data = Database().daySelector();
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: "TEXTO",
                  content: "TEXTO",
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: "TEXTO",
                  content: "TEXTO",
                  imageIcon: Icons.search,
                ),
                Walkthrough(
                  title: "TEXTO",
                  content: "TEXTO",
                  imageIcon: Icons.shopping_cart,
                ),
                Walkthrough(
                  title: "TEXTO",
                  content: "TEXTO",
                  imageIcon: Icons.verified_user,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
        ],
      ),
    );
  }
}
