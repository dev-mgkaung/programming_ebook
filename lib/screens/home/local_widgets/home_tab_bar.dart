import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/network_model/book/book_model.dart';
import 'package:programmingebook/routes.dart';
import 'package:programmingebook/widgets/circular_dot_indicator.dart';
import 'package:programmingebook/widgets/spinKit_loading_widget.dart';
import 'package:programmingebook/screens/bookdetail/book_detail_page.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 32,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 16),
          child: DefaultTabController(
            length: 3,
            child: TabBar(
              labelPadding: EdgeInsets.all(0),
              indicatorPadding: EdgeInsets.all(0),
              isScrollable: true,
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
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 210,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 6),
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.only(right: 10, bottom: 5),
                    elevation: 3,
                    child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          PageRouter.gotoNextPage(context, BookDetailPage(booklist.books[0]));
                        },
                        child: Container(
                          width: 138,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://goalkicker.com/PythonBook/PythonGrow.png",
                              placeholder: (context, url) =>
                                  SpinKitLoadingWidget(
                                      isImage: false, index: 0),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/onboard3.png",
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )));
              }),
        )
      ],
    );
  }
}
