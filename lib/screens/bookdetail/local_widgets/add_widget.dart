import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/screens/bookdetail/blocs/add_to_cart_bloc.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool cartState = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartBloc, String>(builder: (_, buttontext) {
      if (buttontext == "Add to cart") {
        cartState = true;
      } else {
        cartState = false;
      }
      return Padding(
        padding: EdgeInsets.only(right: 10),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          elevation: 1.0,
          onPressed: () {
            context
                .bloc<AddToCartBloc>()
                .add(cartState ? AddToCartEvent.add : AddToCartEvent.remove);
          },
          child: Row(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
              ),
              SizedBox(
                width: 5,
              ),
              Text(buttontext)
            ],
          ),
             color: cartState ? Colors.red : Colors.black54,
        ),
      );
    });
  }
}
