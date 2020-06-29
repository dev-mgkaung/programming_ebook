import 'package:flutter/material.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/bottom_bar.dart';


class PriceWidget extends StatelessWidget {
  const PriceWidget({@required this.widget});
  final BottomBar widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "\$" + widget.bookObject.price.toString(),
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Roboto-Italic",
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          TextSpan(text: "   "),
          TextSpan(
              text: "\$" + (widget.bookObject.price + 1.45).toString(),
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough))
        ]),
      ),
    );
  }
}