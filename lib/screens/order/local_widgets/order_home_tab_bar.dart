
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/local_widgets/circular_dot_indicator.dart';

class OrderTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      height: 25,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 16),
      child: DefaultTabController(
        length: 3,
        child: TabBar(

          labelPadding: EdgeInsets.all(0),
          indicatorPadding: EdgeInsets.all(0),
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          labelStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          indicator:
              CircleTabIndicator(color: Colors.deepOrangeAccent, radius: 3),
          tabs: <Widget>[
            Tab(
              child: Container(
                margin: EdgeInsets.only(right: 23),
                child: Text("Delievered"),
              ),
            ),
            Tab(
              child: Container(
                margin: EdgeInsets.only(right: 23),
                child: Text("Pending"),
              ),
            ),
            Tab(
              child: Container(
                margin: EdgeInsets.only(right: 23),
                child: Text("Processing"),
              ),
            ),
            Tab(
                child: Container(
              margin: EdgeInsets.only(right: 23),
              child: Text("Cancelled"),
            )),
          ],
        ),
      ),
    );
  }
}
