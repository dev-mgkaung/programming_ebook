import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/constraints/styles.dart';


class BottomPopup extends StatelessWidget {
  final Widget child;
  final String title;

  const BottomPopup(
      {Key key, @required this.child, @required this.title, int height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var fullWidth = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.widgetBorderRadius),
                topRight: Radius.circular(AppSizes.widgetBorderRadius),
              )),
          width: fullWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(AppSizes.imageRadius),
                  ),
                ),
              ),
              title != ''
                  ? Text(title, style: Styles.defaultTextStyle)
                  : Container(),
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
              ),
              child
            ],
          ),
        ));
  }
}
