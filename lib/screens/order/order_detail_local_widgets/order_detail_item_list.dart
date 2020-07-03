import 'package:flutter/material.dart';
import 'package:programmingebook/screens/order/order_detail_local_widgets/order_detail_list_item_row.dart';

class OrderDetailItemList extends StatefulWidget {
  @override
  _OrderDetailItemListState createState() => _OrderDetailItemListState();
}

class _OrderDetailItemListState extends State<OrderDetailItemList> {
  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) => Divider(),
    itemBuilder: (BuildContext context, int index) {
      return OrderDetailListItemRow();
      }
    );
  }
}
