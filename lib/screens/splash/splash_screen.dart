import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/page/main_page.dart';
import 'package:programmingebook/widgets/mcircularprogress_loader.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _mockCheckForSession().then((status) {
      if (status) {
        PageRouter.pushPageReplacement(context,MainScreen());
      } else {}
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    return true;
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 200,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new AssetImage('assets/images/splash.png'),
                            fit: BoxFit.fitWidth))),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(splash_text,style: Styles.mediumTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomProgressLoader(30,30),
                )
              ],
            )));
  }
}
