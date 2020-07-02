import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/dimens.dart';


class ActionCard extends StatelessWidget {
  final String title;
  final String linkText;
  final Function onLinkTap;
  final Widget child;

  const ActionCard(
      {Key key,
      @required this.title,
      this.linkText,
      this.child,
      this.onLinkTap})
      : super(key: key);

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
                Row(
                  children: <Widget>[
                    Container(
                        width: width / 3 * 2,
                        child: Text(title,
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:Colors.black),
                        )
                    ),
                    linkText != null
                        ? Container(
                            alignment: Alignment.centerRight,
                            width: width / 3,
                            child: InkWell(
                              onTap: (() => {onLinkTap()}),
                              child: Text(linkText,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:Colors.deepOrange),
                              ),
                            ))
                        : Container()
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSizes.linePadding * 2),
                    child: child)
              ],
            )));
  }
}
