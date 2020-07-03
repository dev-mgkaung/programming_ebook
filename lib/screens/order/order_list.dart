import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/order_local_widgets/bubble_tab_indicator.dart';
import 'package:programmingebook/screens/order/order_local_widgets/order_tab_body_view.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                Navigator.pop(context);
                 },
            ),
            title: Text("My Orders"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
             SizedBox()
            ],
            bottom:  TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.all(4.0),
                unselectedLabelColor: Theme.of(context).primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(10.0),
                indicator:BubbleTabIndicator(
              indicatorHeight: 40.0,
              indicatorColor: Theme.of(context).primaryColor,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
                tabs: [
                  Tab(
                     child: Container(
                       width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 1.5)),
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText("Delivered",style: TextStyle(fontSize: 13),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 1.5)),
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText("Processing",style: TextStyle(fontSize: 13),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 1.5)),
                      child: Align(
                        alignment: Alignment.center,
                        child: AutoSizeText("Cancelled",style: TextStyle(fontSize: 13),),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            OrderTabBarBodyView(tabindex: 0),
            OrderTabBarBodyView(tabindex: 1),
            OrderTabBarBodyView(tabindex: 2),
          ]),
    ))
    );
  }
}
