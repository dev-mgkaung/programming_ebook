import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/screens/onboading/model/onboard_model.dart';
import 'package:programmingebook/screens/page/main_page.dart';
import 'package:programmingebook/services/networks/repositories/app_repository.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  AppRepository appRepository = AppRepository();
  void _onIntroEnd(context) {
    appRepository.setOnBoarded(true);
    PageRouter.pushPageReplacement(context, MainPage());
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.deepOrange),
      bodyTextStyle: Styles.mediumTextStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: onBoardList
          .map((onBoard) => PageViewModel(
                title: onBoard.title,
                body: onBoard.body,
                image: _buildImage(onBoard.image),
                decoration: pageDecoration,
              ))
          .toList(),
      onDone: () => {
        _onIntroEnd(context),
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: Styles.defaultTextStyle),
      next: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
      done: const Text('Done', style: Styles.defaultTextStyle),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
