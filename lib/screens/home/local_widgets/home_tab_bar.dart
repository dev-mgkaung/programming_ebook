import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/home/local_widgets/home_tab_bar_list_item.dart';
import 'package:programmingebook/widgets/circular_dot_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeTabBar extends StatefulWidget {
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            labelPadding: EdgeInsets.all(0),
            indicatorPadding: EdgeInsets.all(0),
            isScrollable: true,
            controller: tabController,
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Theme.of(context).backgroundColor,
            labelStyle: Styles.mediumTextStyle,
            unselectedLabelStyle: Styles.mediumTextStyle,
            indicator:
                CircleTabIndicator(color: Colors.deepOrangeAccent, radius: 2),
            tabs: <Widget>[
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 23),
                  child: Text('tab_new'.tr().toString()),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 23),
                  child: Text('tab_trending'.tr().toString()),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 23),
                  child: Text('tab_best_seller'.tr().toString()),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                DummyList(dummylist: StringsConstants.dummy_new_book),
                DummyList(dummylist: StringsConstants.dummy_trendering_book),
                DummyList(dummylist: StringsConstants.dummy_bestseller_book),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
