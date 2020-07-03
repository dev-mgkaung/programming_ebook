import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/models/order.dart';

class OrderDetailTitle extends StatelessWidget {
  final OrderItem orderItem;

  const OrderDetailTitle({Key key, this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text("Order No # ${orderItem.orderId}",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color:Colors.black),
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: Text(orderItem.orderDate, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.black38),
                  ))
            ],
          ),
          SizedBox(height: 15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text("Quality :  ${orderItem.quality}",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color:Colors.black),
                  )
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text("Delivered",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.green),
                    ),
                  ))
            ],
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
