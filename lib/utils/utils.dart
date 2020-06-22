import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:programmingebook/constraints/colors.dart';
import 'package:programmingebook/routes.dart';

class Utils {

  static void ChangeLanguage(String languge,BuildContext context)
  {
    if(languge=='my'){
      EasyLocalization.of(context).locale= Locale('my');}else
        {
          EasyLocalization.of(context).locale= Locale('en', 'US');
        }
  }
  static Future<void> handleClickMe(BuildContext context) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('language'.tr().toString()),
          //message: Text(''),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('english'.tr().toString()),
              onPressed: () { ChangeLanguage('eng',context);PageRouter.goToBackScreen(context);},
            ),
            CupertinoActionSheetAction(
              child: Text('myanmar'.tr().toString()),
              onPressed: () { ChangeLanguage('my',context);PageRouter.goToBackScreen(context); },
            ),

          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('cancel'.tr().toString()),
            onPressed: () { PageRouter.goToBackScreen(context); },
          ),
        );
      },
    );
  }
  static Future<bool> displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 2,
        backgroundColor: primaryColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static SnackBar displaySnackBar(String message,
      {String actionMessage, VoidCallback onClick}) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      action: (actionMessage != null)
          ? SnackBarAction(
        textColor: Colors.white,
        label: actionMessage,
        onPressed: () {
          return onClick();
        },
      )
          : null,
      duration: Duration(seconds: 2),
      backgroundColor: primaryColor,
    );
  }

  //Snackbar use
//  onClick: () {
//  hideKeyboard();
//  Scaffold.of(context).showSnackBar(Utils.displaySnackBar(
//  "This is Snackbar with Action",
//  actionMessage: "RETRY", onClick: () {
//  // perform button click action
//  print("RETRY clicked");
//  }));
//  });

//Toast Use
//  onClick: () {
//  hideKeyboard();
//  Utils.displayToast("This is toast message");
//  });
}