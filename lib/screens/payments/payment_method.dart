
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/dimens.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/payments/local_widgets/bottom_popup.dart';
import 'package:programmingebook/utils/back_press_widget.dart';
import 'package:programmingebook/widgets/block_subtitle.dart';
import 'package:programmingebook/widgets/custom_button.dart';
import 'package:programmingebook/widgets/custom_checkbox.dart';
import 'package:programmingebook/widgets/input_field.dart';
import 'package:programmingebook/widgets/payment_card_preview.dart';


class PaymentMethodPage extends StatefulWidget {
  final Function changeView;

  const PaymentMethodPage({Key key, this.changeView}) : super(key: key);

  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int paymentCardIndex = 0;
  TextEditingController _nameOnCardController;
  TextEditingController _cardNumberController;
  TextEditingController _expirationDateController;
  TextEditingController _cvvController;
  var showAddNewCardForm = false;
  @override
  void initState() {
    _nameOnCardController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expirationDateController = TextEditingController();
    _cvvController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameOnCardController?.dispose();
    _cardNumberController?.dispose();
    _expirationDateController?.dispose();
    _cvvController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
      appBar: AppBar(
      elevation: 0,
      title: Text(
        "Payment Method",
        style: Styles.defaultTextStyle,
      ),
      leading: BackPressIcon(),
    ),
      body:SingleChildScrollView(
                  child: Stack(children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                    child: Column(children: <Widget>[
                       BlockSubtitle(
                          width: width, title: 'Your payment cards'),
                       PaymentCardPreview(
                        width: width,
                        cardNumber: '**** **** **** 3947',
                        cardHolderName: 'Jennyfer Doe',
                        expirationMonth: 5,
                        expirationYear: 23,
                      ),
                     CustomCheckbox(
                          width: width,
                          title: 'Use as default payment method',
                          checked: true,
                          onTap: ((bool newValue) =>
                              {})),
                     PaymentCardPreview(
                          width: width,
                          cardNumber: '**** **** **** 4546',
                          cardHolderName: 'Jennyfer Doe',
                          expirationMonth: 11,
                          expirationYear: 22,
                          cardType: CardType.Visa),
                       CustomCheckbox(
                          width: width,
                          title: 'Use as default payment method',
                          checked: false,
                          onTap: ((bool newValue) =>
                              {})),
                    ])),
                Positioned(
                  bottom: AppSizes.sidePadding,
                  right: AppSizes.sidePadding,
                  child: FloatingActionButton(
                      mini: true,
                      onPressed: (() =>
                          {
                            setState((){showAddNewCardForm=true;})
                          }),
                      child: Icon(Icons.add, size: 36)),
                ),

                    showAddNewCardForm
                        ?    BottomPopup(
                      title: 'Add new card',
                      child: Column(
                        children: <Widget>[
                          FlutterInputField(
                            controller: _nameOnCardController,
                            hint: 'Name on card',
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(bottom: AppSizes.sidePadding),
                          ),
                          FlutterInputField(
                            controller: _cardNumberController,
                            hint: 'Card number',
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(bottom: AppSizes.sidePadding),
                          ),
                          FlutterInputField(
                            controller: _expirationDateController,
                            hint: 'Expiration Date',
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(bottom: AppSizes.sidePadding),
                          ),
                          FlutterInputField(
                            controller: _cvvController,
                            hint: 'CVV',
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(bottom: AppSizes.sidePadding),
                          ),
                          CustomCheckbox(
                               width: width,
                              title: 'Use as default payment method',
                              checked: false,
                              onTap: ((bool newValue) =>
                              {})),
                          Padding(
                            padding:
                            EdgeInsets.only(bottom: AppSizes.sidePadding),
                          ),
                          FlutterButton(
                            title: 'ADD CARD',
                            onPressed: (() => {
                            }),
                          )
                        ],
                      ),
                    ) : Container()

                  ]
    ))));
}
}


