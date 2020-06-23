import 'package:flutter/material.dart';
class OrderActionBar extends StatefulWidget {
  @override
  _OrderActionBarState createState() => _OrderActionBarState();
}

class _OrderActionBarState extends State<OrderActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            ),
          ),
          Text("My Order List",style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(onPressed: () {  }, icon: Icon(Icons.shopping_cart,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
