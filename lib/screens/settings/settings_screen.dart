import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/order/order_list.dart';
import 'package:programmingebook/utils/utils.dart';
class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 15,top: 20,right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(5),
              clipBehavior: Clip.antiAlias,
              child:
              Column(
                children: <Widget>[
                  ListTile(
                    onTap: (){Utils.handleClickMe(context);},
                    leading: const Icon(Icons.translate),
                    title: Text('language'.tr().toString()),
                    subtitle: Text('subtitle'.tr().toString()),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: (){
                      PageRouter.gotoNextPage(context, MyOrder());
                    },
                    leading: const Icon(Icons.shopping_cart),
                    title: Text('My Order'.tr().toString()),
                   // subtitle: Text('subtitle'.tr().toString()),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

