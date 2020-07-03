import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/entitys/shipping_address_entity.dart';
import 'package:programmingebook/screens/shippingaddress/blocs/shopping_address_event.dart';
import 'package:programmingebook/screens/shippingaddress/blocs/shopping_addresss_bloc.dart';
import 'package:programmingebook/services/persistances/data/local/database_provider.dart';
import 'package:programmingebook/utils/back_press_widget.dart';
import 'package:programmingebook/widgets/custom_button.dart';
import 'package:programmingebook/widgets/input_field.dart';

class AddShippingAddressPage extends StatefulWidget {
  final String title;
  final bool isDeleteMode;
  final int query;
  final ShippingAddressEntity shippingAddressEntity;
  const AddShippingAddressPage(
      {Key key, this.title, this.isDeleteMode, this.query, this.shippingAddressEntity})
      : super(key: key);

  @override
  _AddShippingAddressPageState createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {

  final GlobalKey<_AddShippingAddressPageState> _formKey = GlobalKey<_AddShippingAddressPageState>();

  TextEditingController _fullNameController;
  TextEditingController _addressController;
  TextEditingController _cityController;
  TextEditingController _stateController;
  TextEditingController _postalController;
  TextEditingController _countryController;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _postalController = TextEditingController();
    _countryController = TextEditingController();

    super.initState();
   if(widget.shippingAddressEntity!=null)
    {
      _fullNameController.text=widget.shippingAddressEntity.title;
      _addressController.text=widget.shippingAddressEntity.address;
      _cityController.text=widget.shippingAddressEntity.city;
      _countryController.text=widget.shippingAddressEntity.country;
      _postalController.text=widget.shippingAddressEntity.postal;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController?.dispose();
    _addressController?.dispose();
    _cityController?.dispose();
    _stateController?.dispose();
    _postalController?.dispose();
    _countryController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title, style: Styles.defaultTextStyle),
        leading: BackPressIcon(),
        actions: <Widget>[
          widget.isDeleteMode
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    DatabaseProvider.db.delete(widget.query).then((_) {
                      BlocProvider.of<ShippingAddressBloc>(context).add(
                        DeleteShippingAddress(widget.query),
                      );
                     Navigator.pop(context);
                    });
                  })
              : Container(),
        ],
      ),
      body:Form(
      key: _formKey,
      child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterInputField(
              controller:_fullNameController,
              hint: 'Full name',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterInputField(
              controller: _addressController,
              hint: 'Address',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterInputField(
              controller: _cityController,
              hint: 'City',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterInputField(
              controller: _stateController,
              hint: 'State/Province/Region',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterInputField(
              controller: _postalController,
              hint: 'Zip Code (Postal Code)',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterInputField(
              controller: _countryController,
              hint: 'Country',
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
            ),
            FlutterButton(
                title: 'SAVE ADDRESS',
                onPressed: () {
                  ShippingAddressEntity entity =
                      ShippingAddressEntity(
                          title: _fullNameController.text,
                          address: _addressController.text,
                          city: _cityController.text,
                          postal: _postalController.text,
                          country: _countryController.text,
                          isChecked: true);
                  //delete mode false case is insert
                  widget.isDeleteMode == false
                      ? DatabaseProvider.db
                          .insert(entity)
                          .then((shipping) {
                          BlocProvider.of<ShippingAddressBloc>(context).add(
                            AddShippingAddress(shipping),
                          );
                        })
                      :
                      //delete mode true case is update
                      DatabaseProvider.db.update(entity).then(
                            (data) => BlocProvider.of<ShippingAddressBloc>(context)
                                    .add(UpdateShippingAddress(widget.query, entity),
                            ),
                          );
                  Navigator.pop(context);
                }),
          ]
              ))));
  }
}
