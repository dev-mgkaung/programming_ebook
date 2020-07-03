import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/models/entitys/shipping_address_entity.dart';
import 'package:programmingebook/screens/shippingaddress/blocs/shopping_address_event.dart';

class ShippingAddressBloc extends Bloc<ShippingAddressEvent, List<ShippingAddressEntity>> {

  @override
  List<ShippingAddressEntity> get initialState => List<ShippingAddressEntity>();

  @override
  Stream<List<ShippingAddressEntity>> mapEventToState(ShippingAddressEvent event) async* {
    if (event is SetShippingAddress) {
      yield event.shippinglist;
     }
    else if (event is AddShippingAddress) {
      List<ShippingAddressEntity> newState = List.from(state);
      if (event.newEntity != null) {
        newState.add(event.newEntity);
      }
      yield newState;
    } else if (event is DeleteShippingAddress) {
      List<ShippingAddressEntity> newState = List.from(state);
      newState.removeAt(event.id);
      yield newState;
    } else if (event is UpdateShippingAddress) {
      List<ShippingAddressEntity> newState = List.from(state);
      newState[event.id] = event.updateEntity;
      yield newState;
    }
  }
}
