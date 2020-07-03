import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/models/order.dart';
import 'package:programmingebook/screens/order/order_local_widgets/order_list_listitem.dart';

class OrderTabBarBodyView extends StatefulWidget {
  final int tabindex;

  const OrderTabBarBodyView({Key key, this.tabindex}) : super(key: key);
  @override
  _OrderTabBarBodyViewState createState() => _OrderTabBarBodyViewState();
}

class _OrderTabBarBodyViewState extends State<OrderTabBarBodyView> {
  List<OrderItem> thumblist = [];
  @override
  Widget build(BuildContext context) {
    if (widget.tabindex == 0) {
      thumblist = delivered;
    } else if (widget.tabindex == 1) {
      thumblist = processing;
    } else {
      thumblist = cancelling;
    }

    return new ListView.separated(
      itemCount: thumblist.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return OrderListItemRow(orderItem: thumblist[index]);
      },
    );
  }
}
