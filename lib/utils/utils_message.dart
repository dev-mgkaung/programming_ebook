import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:programmingebook/constraints/colors.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/utils/mmdetect.dart';

class UtilsMessage {
  static void ChangeLanguage(String languge, BuildContext context) {
    if (languge == 'my') {
      EasyLocalization.of(context).locale = Locale('my');
    } else {
      EasyLocalization.of(context).locale = Locale('en', 'US');
    }
  }

  static Future<void> handleClickMe(BuildContext context) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(MMTheme.mmText('language'.tr().toString())),
          //message: Text(''),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(MMTheme.mmText('english'.tr().toString())),
              onPressed: () {
                ChangeLanguage('eng', context);
                PageRouter.goToBackScreen(context);
              },
            ),
            CupertinoActionSheetAction(
              child: Text(MMTheme.mmText('myanmar'.tr().toString())),
              onPressed: () {
                ChangeLanguage('my', context);
                PageRouter.goToBackScreen(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text(MMTheme.mmText('cancel'.tr().toString())),
            onPressed: () {
              PageRouter.goToBackScreen(context);
            },
          ),
        );
      },
    );
  }
}
