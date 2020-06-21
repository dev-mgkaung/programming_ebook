import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/screens/home/local_widgets/home_popular_list.dart';
import 'package:programmingebook/screens/home/local_widgets/home_search_box.dart';
import 'package:programmingebook/screens/home/local_widgets/home_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
            HomeSearchBox(),
            HomeTabBar(),
            HomePopularList(),
          ],)
        ],
      ),
    );
  }
}
