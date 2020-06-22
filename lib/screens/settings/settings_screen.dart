import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:programmingebook/utils/utils.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(left: 15,top: 20,right: 15),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(5),
              child: ListTile(
                onTap: (){Utils.handleClickMe(context);},
                  leading: const Icon(Icons.translate),
                  title: Text('language'.tr().toString()),
                   subtitle: Text('subtitle'.tr().toString()),
                   trailing: const Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
