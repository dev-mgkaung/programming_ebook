import 'package:badges/badges.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/carts/cart_screen.dart';
import 'package:programmingebook/screens/categories/category_screen.dart';
import 'package:programmingebook/screens/home/home_screen.dart';
import 'package:programmingebook/screens/page/drawer_menu.dart';
import 'package:programmingebook/screens/settings/settings_screen.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/main';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _globalKey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.menu,color: Colors.blueAccent),
              onPressed: () {
                _globalKey.currentState.openDrawer();
              },
            ),
            actions: <Widget>[
              Badge(
                position: BadgePosition.topRight(top: 10, right: 5),
                badgeContent: Text('1', style: Styles.notiTextStyle),
                child: IconButton(
                  icon: Icon(Icons.chat, color: Colors.deepPurple),
                  onPressed: () {},
                ),
              ),
              Badge(
                position: BadgePosition.topRight(top: 10, right: 10),
                badgeContent: Text('3', style: Styles.notiTextStyle),
                child: IconButton(
                  icon:
                      Icon(Icons.notifications_active, color: Colors.deepPurple),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body:_getPage(currentPage),
          drawer: AppDrawer(),
          bottomNavigationBar: FancyBottomNavigation(
            barBackgroundColor: Colors.white,
            initialSelection: 0,
            circleColor: Colors.deepPurpleAccent,
            activeIconColor: Colors.white,
            inactiveIconColor: Colors.blueGrey,
            textColor: Colors.deepPurpleAccent,
            tabs: [
              TabData(
                  iconData: Icons.home,
                  title: "Home",
                  onclick: () {
                    final FancyBottomNavigationState fState =
                        _globalKey.currentState as FancyBottomNavigationState;
                    fState.setPage(1);
                  }),
              TabData(
                  iconData: Icons.library_books,
                  title: "Books",
                  onclick: () {
                    final FancyBottomNavigationState fState =
                        _globalKey.currentState as FancyBottomNavigationState;
                    fState.setPage(2);
                  }),
              TabData(
                  iconData: Icons.shopping_cart,
                  title: "Cart",
                  onclick: () {
                    final FancyBottomNavigationState fState =
                        _globalKey.currentState as FancyBottomNavigationState;
                    fState.setPage(3);
                  }),
              TabData(
                  iconData: Icons.account_circle,
                  title: "Profile",
                  onclick: () {
                    final FancyBottomNavigationState fState =
                        _globalKey.currentState as FancyBottomNavigationState;
                    fState.setPage(4);
                  }),
            ],
            onTabChangedListener: (position) {
              setState(() {
                currentPage = position;
              });
            },
          )),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return HomeScreen();
      case 1:
        return CategoryScreen();
      case 2:
        return CartScreen();
      default:
        return SettingScreen();
    }
  }
}
