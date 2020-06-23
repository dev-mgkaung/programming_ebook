import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/screens/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:programmingebook/utils/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: appName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? dark : light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
