import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AddToCartEvent { add, remove }

class AddToCartBloc extends Bloc<AddToCartEvent, String> {
  @override
  String get initialState => "Add to cart";

  @override
  Stream<String> mapEventToState(AddToCartEvent event) async* {
    switch (event) {
      case AddToCartEvent.add:
        yield "Add to cart";
        break;
      case AddToCartEvent.remove:
        yield "Remove to cart";
        break;
      default:
        throw Exception('oops');
    }
  }
}
