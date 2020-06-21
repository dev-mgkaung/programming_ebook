import 'package:badges/badges.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/constraints/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                _ActionBarSearch(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _customBottomNavigationBar());
  }

  Widget _customBottomNavigationBar() {
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

  Widget _ActionBarSearch() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //Custom App Bar
      Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 GestureDetector(
                  onTap: () {
                    print("On Taped  Drawer Menu");
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
          )),
      //Search Bar
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 16),
        child: Text(home_label,
            style: GoogleFonts.openSans(
                color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w600)),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15, left: 16),
        child: Text(latest_book, style: Styles.mediumTextStyle),
      ),
    ]);
  }
}
