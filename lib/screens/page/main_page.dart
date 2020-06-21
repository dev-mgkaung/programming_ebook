import 'package:badges/badges.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:programmingebook/screens/carts/cart_screen.dart';
import 'package:programmingebook/screens/categories/category_screen.dart';
import 'package:programmingebook/screens/home/home_screen.dart';
import 'package:programmingebook/screens/page/drawer_menu.dart';
import 'package:programmingebook/screens/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {

  static const String routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentPage = 0;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        _HomeActionBar(),
        _getPage(currentPage),
    ])
    ),
    drawer: AppDrawer(),
    bottomNavigationBar: FancyBottomNavigation(
    barBackgroundColor: Colors.white,
    initialSelection: 0,
    circleColor: Colors.deepPurpleAccent,
    activeIconColor: Colors.white,
    inactiveIconColor: Colors.blueGrey,
    textColor: Colors.deepPurpleAccent,
    tabs: [
    TabData(iconData: Icons.home, title: "Home",
        onclick: () {
       final FancyBottomNavigationState fState = _globalKey.currentState as FancyBottomNavigationState;
       fState.setPage(1);
    }),
    TabData(iconData: Icons.library_books, title: "Books", onclick: () {
      final FancyBottomNavigationState fState = _globalKey.currentState as FancyBottomNavigationState;
      fState.setPage(2);
    }),
    TabData(iconData: Icons.shopping_cart, title: "Cart", onclick: () {
      final FancyBottomNavigationState fState = _globalKey.currentState as FancyBottomNavigationState;
      fState.setPage(3);
    }),
    TabData(iconData: Icons.more, title: "More", onclick: () {
      final FancyBottomNavigationState fState = _globalKey.currentState as FancyBottomNavigationState;
      fState.setPage(4);
    }),
    ],
      onTabChangedListener: (position) {
      setState(() {
      currentPage = position;
     });
    },
    )
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
        return SettingsScreen();
    }
  }

  Widget _HomeActionBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  _globalKey.currentState.openDrawer();
                },
                child: SvgPicture.asset(
                  "assets/svg/drawer_menu.svg",
                  width: 26,
                  height: 26,
                  color: Colors.black54,
                )),
            Row(children: [
              Badge(
                position: BadgePosition.topRight(top: 10, right: 5),
                badgeContent: Text('1',
                    style: TextStyle(color: Colors.white, fontSize: 8)),
                child: IconButton(
                  icon: Icon(Icons.chat,
                      color: Colors.deepPurple),
                  onPressed: () {},
                ),
              ),
              Badge(
                position: BadgePosition.topRight(top: 10, right: 10),
                badgeContent: Text('3',
                    style: TextStyle(color: Colors.white, fontSize: 8)),
                child: IconButton(
                  icon: Icon(Icons.notifications_active,
                      color: Colors.deepPurple),
                  onPressed: () {},
                ),
              )
            ]),
          ],
        ));
  }
}
