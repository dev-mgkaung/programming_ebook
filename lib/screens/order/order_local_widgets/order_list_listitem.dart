import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/order/models/order.dart';
import 'package:programmingebook/screens/order/order_detail.dart';

class OrderListItemRow extends StatefulWidget {
  final OrderItem orderItem;

  const OrderListItemRow({Key key, this.orderItem}) : super(key: key);
  @override
  _OrderListItemRowState createState() => _OrderListItemRowState();
}

class _OrderListItemRowState extends State<OrderListItemRow> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 4;
    return Padding(
        padding: EdgeInsets.all(AppSizes.sidePadding),
        child: Container(
            padding: EdgeInsets.all(AppSizes.sidePadding),
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(AppSizes.imageRadius)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.3),
                      blurRadius: AppSizes.imageRadius,
                      offset: Offset(0.0, AppSizes.imageRadius))
                ]),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text("Order No # ${widget.orderItem.orderId}",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color:Colors.black),
                        )
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(widget.orderItem.orderDate, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color: Colors.black38),
                        ))
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Text("Quality :  ${widget.orderItem.quality}",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color:Colors.black),
                        )
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Text("Total :${widget.orderItem.totalAmount} Kyats",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black26),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: InkWell(
                          child: Text("Details",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,color:Colors.black),
                          ),
                          onTap: (){PageRouter.gotoNextPage(context, OrderDetail(orderItem: widget.orderItem,));},
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Text("${widget.orderItem.orderStatus}",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.green),
                        ))
                  ],
                ),
              ],
            )));
  }
}
