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
      theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.orange,
          primaryColor: Colors.orangeAccent,
          primarySwatch: Colors.orange,
        //  fontFamily: quickFont
      ),
      home: SplashScreen(),
    );
  }
}
