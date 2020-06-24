import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../routes.dart';
import '../../screens/order/order_list.dart';
import '../../utils/theme.dart';
import '../../utils/utils_message.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(1),
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
              Card(
                elevation: 10,
                margin: const EdgeInsets.all(5),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.edit),
                      title: Text("Edit My Profile"),
                      // subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.local_shipping),
                      title: Text("Shipping Address"),
                      // subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.payment),
                      title: Text("Payment Method"),
                      // subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        UtilsMessage.handleClickMe(context);
                      },
                      leading: const Icon(Icons.translate),
                      title: Text('language'.tr().toString()),
                      subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        PageRouter.gotoNextPage(context, MyOrder());
                      },
                      leading: const Icon(Icons.shopping_cart),
                      title: Text('My Order'.tr().toString()),
                      // subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite_border),
                      title: Text("My Favourite"),
                      // subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.chat),
                      title: Text("Customer Service"),
                      // subtitle: Text('subtitle'.tr().toString()),
                      trailing: const Icon(Icons.arrow_drop_down_circle),
                    ),
                    Divider(),
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
                    SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
