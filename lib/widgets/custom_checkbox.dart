

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class CustomCheckbox extends StatelessWidget {
  final double width;
  final String title;
  final bool checked;
  final Function(bool) onTap;

  final mainAxisAlignment;

  const CustomCheckbox({
    Key key,
    this.width,
    @required this.title,
    this.checked,
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var rightLinkWidth = 100.0;
    return Container(
        child: InkWell(
            onTap: (() => {onTap(!checked)}),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Checkbox(
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    hoverColor:Colors.blueGrey,
                    focusColor: Colors.deepOrange,
                    value: checked,
                    onChanged: ((bool newValue) => {onTap(newValue)})),
                Container(
                  width: width - rightLinkWidth,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color:Colors.black),
                  ),
                ),
              ],
            )));
  }
}
