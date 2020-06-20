import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programmingebook/screens/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

//    SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle.dark.copyWith(
//          statusBarColor: Colors.transparent,
//          statusBarIconBrightness: Brightness.light),
//    );

    return MaterialApp(
      title: 'Programming Ebook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //buttonColor: Colors.white,
          brightness: Brightness.light,
          accentColor: Colors.orange,
          primaryColor: Colors.orangeAccent,
          primarySwatch: Colors.orange,
          //fontFamily: quickFont
      ),
      home: HomeScreen(),
//        initialRoute: '/',
//        routes: <String, WidgetBuilder>{
//          '/': (context) => SplashScreen()
//        }

    );
  }
}
