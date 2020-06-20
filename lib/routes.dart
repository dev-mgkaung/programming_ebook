import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PageRouter {
  static void gotoNextPage(BuildContext context,Widget nextScreen) {
    Navigator.push(
      context,
      RouteTransition(
          widget: nextScreen,
      ),
    );
  }

  static void goToBackScreen(BuildContext context){
    Navigator.pop(context);
  }

  static pushPageReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}



class RouteTransition extends PageRouteBuilder{
  final Widget widget;
  final bool fade;

  RouteTransition({this.widget,this.fade = true}):
        super(
          pageBuilder:(BuildContext context, Animation<double> animation,Animation<double> secondaryAni) => widget,
          transitionDuration: Duration(milliseconds: 100),
          transitionsBuilder:(BuildContext context, Animation<double> animation,Animation<double> secondaryAni, Widget child){
            if(fade){
              return FadeTransition(opacity: animation, child: child,);
            }
            {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            }
          }
      );
}