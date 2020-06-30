import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:programmingebook/screens/settings/profile_list_item.dart';
import '../../routes.dart';
import '../../screens/order/order_list.dart';
import '../../constraints/theme.dart';
import '../../utils/utils_message.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
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
              child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffFDCF09),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/mgkaung.jpg'),
                    ),
                  )),
            ),
          ),
          new ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              ProfileListItem(
                icon: FontAwesomeIcons.userEdit,
                text: 'Edit My Profile',
              ),
              ProfileListItem(
                icon: FontAwesomeIcons.addressCard,
                text: 'Shipping Address',
              ),
              ProfileListItem(
                icon: FontAwesomeIcons.paypal,
                text: 'Payment Method',
              ),
              GestureDetector(
                child: ProfileListItem(
                  icon: FontAwesomeIcons.language,
                  text: 'Change Language',
                ),
                onTap: (){ UtilsMessage.handleClickMe(context);},
              ),
              ProfileListItem(
                icon: FontAwesomeIcons.firstOrder,
                text: 'My Order',
              ),
              ProfileListItem(
                icon: FontAwesomeIcons.save,
                text: 'Favourite',
                hasNavigation: false,
              ),
            ],
          ),
          SizedBox(height: 10,),
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
          SizedBox(height: 50,)
        ],
        )
        ],
    );
  }
}
