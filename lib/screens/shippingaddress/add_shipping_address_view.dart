import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/shippingaddress/checkout_bloc.dart';
import 'package:programmingebook/screens/shippingaddress/checkout_event.dart';
import 'package:programmingebook/screens/shippingaddress/checkout_state.dart';
import 'package:programmingebook/utils/back_press_widget.dart';
import 'package:programmingebook/widgets/custom_button.dart';
import 'package:programmingebook/widgets/input_field.dart';


class AddShippingAddressView extends StatefulWidget {

  const AddShippingAddressView({Key key}) : super(key: key);

  @override
  _AddShippingAddressViewState createState() => _AddShippingAddressViewState();
}

class _AddShippingAddressViewState extends State<AddShippingAddressView> {
  int paymentCardIndex = 0;

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
  }

  @override
  void dispose() {
    _fullNameController?.dispose();
    _addressController?.dispose();
    _cityController?.dispose();
    _stateController?.dispose();
    _postalController?.dispose();
    _countryController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        title: Text(
        "New My Address",
        style: Styles.defaultTextStyle,
      ),
    leading: BackPressIcon(),
    ),
    body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: AppSizes.sidePadding),
                          ),
                    FlutterInputField(
                      controller: _fullNameController,
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
                      padding: EdgeInsets.only(bottom:AppSizes.sidePadding),
                    ),
                    FlutterButton(
                      title: 'SAVE ADDRESS',
                      onPressed: (() => {

                          }
                          ),
                    )
                  ],
                )));

  }
}
