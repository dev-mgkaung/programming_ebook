
import 'package:badges/badges.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int buttomNavIndex = 0;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  PageController pageControllder = PageController(
      initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      buttomNavIndex = index;
      currentPage = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentPage = index;
      pageControllder.animateToPage(
          index, duration: Duration(microseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),
            onPressed: () {
              _globalKey.currentState.openDrawer();
            },),
          actions: <Widget>[
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
            ),
          ],
        ),
        body: PageView(
            controller: pageControllder,
            onPageChanged: (index) {
              pageChanged(index);
            },
            children: <Widget>[
              HomeScreen(),
              CategoryScreen(),
              CartScreen(),
              SettingScreen()
            ]
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: FancyBottomNavigation(
          barBackgroundColor: Colors.white,
          initialSelection: buttomNavIndex,
          circleColor: Colors.deepPurpleAccent,
          activeIconColor: Colors.white,
          inactiveIconColor: Colors.blueGrey,
          textColor: Colors.deepPurpleAccent,
          tabs: [
            TabData(iconData: Icons.home, title: "Home",
                onclick: () {
                  final FancyBottomNavigationState fState = _globalKey
                      .currentState as FancyBottomNavigationState;
                  fState.setPage(1);
                }),
            TabData(iconData: Icons.library_books, title: "Books", onclick: () {
              final FancyBottomNavigationState fState = _globalKey
                  .currentState as FancyBottomNavigationState;
              fState.setPage(2);
            }),
            TabData(iconData: Icons.shopping_cart, title: "Cart", onclick: () {
              final FancyBottomNavigationState fState = _globalKey
                  .currentState as FancyBottomNavigationState;
              fState.setPage(3);
            }),
            TabData(iconData: Icons.more, title: "More", onclick: () {
              final FancyBottomNavigationState fState = _globalKey
                  .currentState as FancyBottomNavigationState;
              fState.setPage(4);
            }),
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
              bottomTapped(position);
            });
          },
        )
    );
  }
}
