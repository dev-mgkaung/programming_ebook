import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/constraints/styles.dart';
import '../../screens/home/local_widgets/home_popular_list.dart';
import '../../screens/home/local_widgets/home_search_box.dart';
import '../../screens/home/local_widgets/home_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          HomeSearchBox(),
          HomeTabBar(),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 10),
            child: Text(StringsConstants.popular_label, style: Styles.mediumTextStyle),
          ),
          HomePopularList(),
        ],)
      ],
    );
  }
}

