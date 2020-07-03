import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/order/order_list.dart';
import 'package:programmingebook/screens/payments/payment_method.dart';
import 'package:programmingebook/screens/settings/profile_list_item.dart';
import 'package:programmingebook/screens/shippingaddress/add_shipping_address.dart';
import 'package:programmingebook/screens/shippingaddress/shopping_address_view.dart';
import 'package:programmingebook/utils/asset_path.dart';
import '../../constraints/theme.dart';
import '../../utils/utils_message.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  File _image;

  getImageFile(ImageSource source) async {
    //Clicking or Picking from Gallery
    var image = await ImagePicker.pickImage(source: source);
    //Cropping the image
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      setState(() {
        _image = croppedFile;
      });
  }
    }

  void pickImage() {
     showDialog<ImageSource>
      (
      context: context,
      builder:(context) => AlertDialog(title: Text("Select the image source"),
      actions: <Widget>[
        MaterialButton(child: Text("Camera"), onPressed: () {
        getImageFile(ImageSource.camera);
        Navigator.pop(context,ImageSource.camera);
       }),
        MaterialButton(child: Text("Gallery"), onPressed: () {
          getImageFile(ImageSource.gallery);
          Navigator.pop(context,ImageSource.gallery);
       }),
      ])
      );
  }

  @override
  Widget build(BuildContext context) {
    print(_image?.lengthSync());
    return new ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    width: 100,
                    height: 100,
                    child: Stack(children: <Widget>[
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:  _image==null ?AssetImage(AssetsPath.imagepath+'mgkaung.jpg'): FileImage(_image),
                              )
                          )
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () => pickImage(),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              heightFactor: 15,
                              widthFactor: 15,
                              child: Icon(FontAwesomeIcons.pen,
                                  color: Colors.black87, size: 15),
                            ),
                          ),
                        ),
                      )
                    ]))),
            new ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                GestureDetector(
                  child: ProfileListItem(
                    icon: FontAwesomeIcons.userEdit,
                    text: 'Edit My Profile',
                  ),

                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: FontAwesomeIcons.addressCard,
                    text: 'Shipping Address',
                  ),
                  onTap: (){PageRouter.pushPageReplacement(context, ShippingAddressView());},
                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: FontAwesomeIcons.paypal,
                    text: 'Payment Method',
                  ),
                  onTap:(){
                    PageRouter.gotoNextPage(context, PaymentMethodPage());
                  }
                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: FontAwesomeIcons.language,
                    text: 'Change Language',
                  ),
                  onTap: () {
                    UtilsMessage.handleClickMe(context);
                  },
                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: FontAwesomeIcons.firstOrder,
                    text: 'My Order',
                  ),
                  onTap: (){PageRouter.gotoNextPage(context, MyOrder());},
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.save,
                  text: 'Favourite',
                  hasNavigation: false,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
              value: true,
              onChanged: (bool value) {
                setState(() {});
              },
              title: Text("Notification"),
              // subtitle: Text('subtitle'.tr().toString()),
            ),
            Divider(),
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                title: Text("Dark Mode"),
                onChanged: (val) {
                  notifier.toggleTheme();
                },
                value: notifier.darkTheme,
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        )
      ],
    );
  }
}
