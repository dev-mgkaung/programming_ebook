import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/onboading/onboading.dart';
import 'package:programmingebook/utils/mmdetect.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _mockCheckForSession().then((status) {
      if (status) {
        PageRouter.pushPageReplacement(context, OnBoardingPage());
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
          padding: const EdgeInsets.all(8),
          child: Center(
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: new Text(MMTheme.mmText('splash'.tr().toString()), style: TextStyle(fontSize: 16)),
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SpinKitThreeBounce(
            color: Colors.cyan,
            size: 25.0,
          )),
      ],
    )));
  }
}
