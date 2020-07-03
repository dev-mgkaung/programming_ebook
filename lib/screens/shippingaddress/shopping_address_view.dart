import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/entitys/shipping_address_entity.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/shippingaddress/add_shipping_address.dart';
import 'package:programmingebook/screens/shippingaddress/blocs/shopping_address_event.dart';
import 'package:programmingebook/screens/shippingaddress/blocs/shopping_addresss_bloc.dart';
import 'package:programmingebook/screens/shippingaddress/local_widgets/build_shipping_address.dart';
import 'package:programmingebook/services/persistances/data/local/database_provider.dart';
import 'package:programmingebook/utils/back_press_widget.dart';

class ShippingAddressView extends StatefulWidget {

  const ShippingAddressView({Key key}) : super(key: key);

  @override
  _ShippingAddressViewState createState() => _ShippingAddressViewState();
                              }

class _ShippingAddressViewState extends State<ShippingAddressView> {
  @override
  void initState() {
    super.initState();
     DatabaseProvider.db.getShippingAddressList().then(
          (list) {
        BlocProvider.of<ShippingAddressBloc>(context).add(SetShippingAddress(list));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(elevation: 0, title: Text("My Shipping Address", style: Styles.defaultTextStyle,),
        leading: BackPressIcon(),
                       ),
        body: SafeArea(
        child: Container(
        child: BlocConsumer<ShippingAddressBloc, List<ShippingAddressEntity>>(
        builder: (context, list) {
          // return widget here based on ShippingAddressBloc's state
        return  Stack(children: <Widget>[
              ListView.separated(
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
               ShippingAddressEntity shipping = list[index];
                return  buildShippingAddress( width: width, title: shipping.title,address:shipping.address,checked: shipping.isChecked,id:shipping.id,shippingAddressEntity: shipping,);
              },
            ),
             Positioned(
             bottom: 20,
             right: 20,
             child: FloatingActionButton(
             onPressed: (() => {
             PageRouter.gotoNextPage(context, AddShippingAddressPage(title: "New My Address",isDeleteMode: false,))
             }),
             child: Icon(Icons.add, size: 36)),
           ),
          ]);
          },
           listener: (BuildContext context, list) {
           // do stuff here based on ShippingAddressBloc's state
           },
      ),
      ),
    ),)
    );
  }
}