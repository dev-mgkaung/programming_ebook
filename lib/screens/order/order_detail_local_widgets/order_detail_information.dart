import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';

class OrderDetailInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Order Information",style: Styles.defaultTextStyle,),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AutoSizeText("Shopping Address"),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: AutoSizeText("No -7 , Myat Kyi Tar Street, Daik -U Township, Bago State",maxLines: 2,
                overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AutoSizeText("Payment Method"),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: AutoSizeText("3243 3423 324 3243",maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AutoSizeText("Discount"),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: AutoSizeText("10 % of personal promo code",maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: AutoSizeText("Total Amount"),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: AutoSizeText("50000 Kyats",maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
}
