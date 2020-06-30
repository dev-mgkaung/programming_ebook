import 'package:flutter/material.dart';
import 'package:programmingebook/models/network_model/book/book_model.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/price_widget.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/add_widget.dart';

class BottomBar extends StatefulWidget {
  final Book bookObject;

  BottomBar(this.bookObject);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
              color: Colors.black12,
              width: 1,
            ))),
        child: Row(
          children: <Widget>[PriceWidget(widget: widget), AddButton()],
        ),
      ),
    );
  }
}
