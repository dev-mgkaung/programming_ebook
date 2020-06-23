import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/local_widgets/order_action_bar.dart';
import 'package:programmingebook/screens/order/local_widgets/order_home_tab_bar.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              OrderActionBar(),
              OrderTabBar(),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, int) {
                      return Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(5),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Order Date : 26.6.2020",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    "Order ID  :   #8048880",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    "Total :   100000 kyats",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
