import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  String _buttonText = "Add to cart";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        elevation: 1.0,
        onPressed: () {
          setState(() {
            _addToCart();
          });
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _buttonText,
            )
          ],
        ),
     //   color: inCart ? Colors.red : Colors.black54,
      ),
    );
  }

  _addToCart() {
  //  inCart = !inCart;
   // _buttonText = (inCart == false) ? "Add to cart" : "Remove from cart";
  }
}