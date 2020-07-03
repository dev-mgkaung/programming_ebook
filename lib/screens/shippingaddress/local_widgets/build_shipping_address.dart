import 'package:flutter/material.dart';
import 'package:programmingebook/models/entitys/shipping_address_entity.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/widgets/action_card.dart';
import 'package:programmingebook/widgets/custom_checkbox.dart';
import '../add_shipping_address.dart';

class buildShippingAddress extends StatefulWidget {
  final int id;
  final double width;
  final String title;
  final String address;
  final bool checked;
  final ShippingAddressEntity shippingAddressEntity;

  const buildShippingAddress({Key key, this.width, this.title, this.address, this.checked, this.id,this.shippingAddressEntity}) : super(key: key);

  @override
  _buildShippingAddressState createState() => _buildShippingAddressState();
}

class _buildShippingAddressState extends State<buildShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return  ActionCard(
          title: widget.title,
          linkText: 'Edit',
          onLinkTap: (){
            PageRouter.gotoNextPage(context, AddShippingAddressPage(query: widget.id, title: "Edit My Address",isDeleteMode: true,shippingAddressEntity: widget.shippingAddressEntity));
          },
          child: Column(children: <Widget>[
            RichText(
              text: TextSpan(
                  text: widget.address,style: TextStyle(color: Colors.black38)
              ),
              maxLines: 2,
            ),
            Container(
                width: widget.width,
                alignment: Alignment.centerRight,
                child: CustomCheckbox(
                    width: widget.width,
                    title: 'Use as the shipping address',
                    checked: widget.checked,
                    onTap: ((bool newValue) =>
                    {

                    })
                )),
          ]));
  }
}
