import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/screens/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:programmingebook/utils/theme.dart';
import 'package:programmingebook/widgets/refresh_scroll_indicator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.blueAccent,
      statusBarIconBrightness: Brightness.dark),
    );

    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return RefreshConfiguration(
              footerTriggerDistance: 15,
              dragSpeedRatio: 0.91,
              headerBuilder: () => MaterialClassicHeader(),
              footerBuilder: () => ClassicFooter(),
              enableLoadingWhenNoData: false,
              shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
          },
          autoLoad: true,
           child:  MaterialApp(
            title: appName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? dark : light,
            home: SplashScreen(),
             builder: (context, child) {
               return ScrollConfiguration(
                 child: child,
                 behavior: RefreshScrollBehavior(),
               );
             },
          ));
        },
      ),
    );
  }
}
