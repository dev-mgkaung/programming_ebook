import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.deepOrangeAccent,
      height: 43,
      child: DefaultTabController(
        length: 4,
        child: TabBar(
          labelPadding: EdgeInsets.all(0),
          indicatorPadding: EdgeInsets.all(0),
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          labelStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          tabs: <Widget>[
            Tab(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 23),
                child: Text(
                  "Delievered",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Tab(
              child: Container(
                margin: EdgeInsets.only(right: 23),
                child: Text(
                  "Pending",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Tab(
              child: Container(
                margin: EdgeInsets.only(right: 23),
                child: Text(
                  "Processing",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Tab(
                child: Container(
              margin: EdgeInsets.only(right: 23),
              child: Text(
                "Cancelled",
                style: TextStyle(color: Colors.white),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
