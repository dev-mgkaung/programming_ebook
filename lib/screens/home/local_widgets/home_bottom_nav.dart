import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
class HomeBottomNav extends StatefulWidget {
  @override
  _HomeBottomNavState createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return FancyBottomNavigation(
      barBackgroundColor: Colors.white,
      initialSelection: 0,
      circleColor: Colors.deepPurpleAccent,
      activeIconColor: Colors.white,
      inactiveIconColor: Colors.blueGrey,
      textColor: Colors.deepPurpleAccent,
      tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.library_books, title: "Books"),
        TabData(iconData: Icons.shopping_cart, title: "Cart"),
        TabData(iconData: Icons.more, title: "More")
      ],
      onTabChangedListener: (position) {
        setState(() {
          currentPage = position;
        });
      },
    );
  }
}
