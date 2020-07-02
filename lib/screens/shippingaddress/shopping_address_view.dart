import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/utils/back_press_widget.dart';

import 'package:programmingebook/widgets/action_card.dart';
import 'package:programmingebook/widgets/custom_checkbox.dart';

import 'add_shipping_address_view.dart';

class ShippingAddressView extends StatefulWidget {

  const ShippingAddressView({Key key}) : super(key: key);

  @override
  _ShippingAddressViewState createState() => _ShippingAddressViewState();
}

class _ShippingAddressViewState extends State<ShippingAddressView> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width - AppSizes.sidePadding * 2;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "My Shipping Address",
            style: Styles.defaultTextStyle,
          ),
          leading: BackPressIcon(),
        ),
        body: SingleChildScrollView(
                  child: Stack(children: <Widget>[
                    Column(
                      children: <Widget>[
                        _buildShippingAddress( width,"Mg Kaung","No7-Myanmar 399,Aung Chan Tar", true),
                        _buildShippingAddress(width, "Mg Kaung","No7-Myanmar 399,Aung Chan Tar",false),
                        _buildShippingAddress( width,"Mg Kaung","No7-Myanmar 399,Aung Chan Tar", false),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: FloatingActionButton(
                          mini: true,
                          onPressed: (() => {
                            PageRouter.gotoNextPage(context, AddShippingAddressView())
                          }),
                          child: Icon(Icons.add, size: 36)),
                    ),
                  ])),
      ),
    );

  }

  Widget _buildShippingAddress(
       double width, String title,String address,bool checked) {
    return ActionCard(
        title: title,
        linkText: 'Edit',

        child: Column(children: <Widget>[
          RichText(
            text: TextSpan(
                text: address,style: TextStyle(color: Colors.black38)
            ),
            maxLines: 2,
          ),
        Container(
              width: width,
              alignment: Alignment.centerRight,
              child: CustomCheckbox(
                  width: width,
                  title: 'Use as the shipping address',
                  checked: checked,
                  onTap: ((bool newValue) =>
                  {

                  })
              )),
        ]));
  }


}