import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:programmingebook/screens/home/local_widgets/home_bottom_nav.dart';
import 'package:programmingebook/screens/home/local_widgets/home_drawer_menu.dart';
import 'package:programmingebook/screens/home/local_widgets/home_search_box.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        body: SafeArea(
          child: Container(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start, children: [
                _HomeActionBar(),
                 HomeSearchBox()
              ],)
              ],
            ),
          ),
        ),
        drawer: HomeAppDrawer(),
        bottomNavigationBar: HomeBottomNav());
  }

  Widget _HomeActionBar() {
    return Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 GestureDetector(
                  onTap: () {
                    _drawerKey.currentState.openDrawer();
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
