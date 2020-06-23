import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/screens/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: SplashScreen(),
    );
  }
  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.brown,
        primaryColorDark: Colors.blueAccent,
        primaryIconTheme: base.iconTheme.copyWith(color: Colors.white));
  }

}
