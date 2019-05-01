import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultipleGridView();
  }
}

class MultipleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        children: <Widget>[
          Text("Semana 1"),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    "$index",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              );
            },
          ),
          Text("Semana 2"),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    "$index",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              );
            },
          ),
          Text("Semana 3"),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    "$index",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              );
            },
          ),
          Text("Semana 4"),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: new Container(
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        "$index",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
