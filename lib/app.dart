import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/screens/home/home_screen.dart';
import 'package:programmingebook/screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: SplashScreen(),
    );
  }
  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        primaryIconTheme: base.iconTheme.copyWith(color: Colors.black));
  }

}
