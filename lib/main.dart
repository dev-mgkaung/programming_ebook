import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmingebook/app.dart';
import 'package:programmingebook/app_config.dart';
import 'package:programmingebook/services/base/base_bloc_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppConfig();
  BlocSupervisor.delegate = BaseBlocDelegate();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('my')],
      path: 'resources/langs',
      saveLocale: true,
      fallbackLocale: Locale('en', 'US'),
      child: App()));
}
