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
    final AddToCartBloc addToCartBloc = BlocProvider.of<AddToCartBloc>(context);
    return BlocBuilder<AddToCartBloc, String>(builder: (_, buttontext) {
      if (buttontext == "Add to cart") {
        cartState = false;
      } else {
        cartState = true;
      }
      return Padding(
        padding: EdgeInsets.only(right: 10),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          elevation: 1.0,
          onPressed: () {
            addToCartBloc
                .add(cartState ? AddToCartEvent.add : AddToCartEvent.remove);
          },
          child: Row(
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                buttontext,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          color: cartState ? Colors.red : Colors.black54,
        ),
      );
    });
  }
}
