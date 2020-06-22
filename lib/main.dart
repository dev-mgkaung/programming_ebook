import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/app.dart';

void main() {
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('my')],
        path: 'resources/langs',
        saveLocale: true,
        fallbackLocale: Locale('en', 'US'),
        child: App()
  ));
}
