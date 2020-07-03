import 'package:programmingebook/models/entitys/shipping_address_entity.dart';

abstract class ShippingAddressEvent {}

//Insert one entinty Event
class AddShippingAddress extends ShippingAddressEvent {
  ShippingAddressEntity newEntity;

  AddShippingAddress(ShippingAddressEntity shippingAddressEntity) {
    newEntity = shippingAddressEntity ;
  }
}

//Delete Event
class DeleteShippingAddress extends ShippingAddressEvent {
  int id;

  DeleteShippingAddress(int index) {
    id = index;
  }
}

//insert list event
class SetShippingAddress extends ShippingAddressEvent {
  List<ShippingAddressEntity> shippinglist;

  SetShippingAddress(List<ShippingAddressEntity> list) {
    shippinglist = list;
  }
}

//Update Event
class UpdateShippingAddress extends ShippingAddressEvent {
  ShippingAddressEntity updateEntity;
  int id;

  UpdateShippingAddress(int index, ShippingAddressEntity shippingAddressEntity) {
  updateEntity = shippingAddressEntity;
  id = index;
}
}