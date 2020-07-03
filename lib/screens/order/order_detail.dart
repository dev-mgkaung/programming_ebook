import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/models/order.dart';
import 'package:programmingebook/screens/order/order_detail_local_widgets/order_detail_information.dart';
import 'package:programmingebook/screens/order/order_detail_local_widgets/order_detail_item_list.dart';
import 'package:programmingebook/screens/order/order_detail_local_widgets/order_detail_title.dart';
class OrderDetail extends StatefulWidget {
  final OrderItem orderItem;

  const OrderDetail({Key key, this.orderItem}) : super(key: key);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(elevation: 0,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
        Navigator.pop(context);
               },
    ),
    title: Text("Orders Detail")
    ),
    body: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
     OrderDetailTitle(orderItem:  widget.orderItem),
     OrderDetailItemList(),
     OrderDetailInformation(),
      SizedBox(height: 70,),
    ],
    ),
    ),
      bottomNavigationBar: new Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton.icon(
                padding: EdgeInsets.all(10),
                icon: const Icon(Icons.border_all,color: Colors.white,),
                label: Text("ReOrder"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                },
                color: Colors.black,
                textColor: Colors.white,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(8),
              icon: const Icon(Icons.cancel,color: Colors.white,),
              label: Text("Cancel Order"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
              },
              color: Colors.redAccent,
              textColor: Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}
