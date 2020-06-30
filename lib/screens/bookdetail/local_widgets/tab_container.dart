import 'package:flutter/material.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/book_detail_page_body.dart';
import 'package:programmingebook/widgets/youtube_player_view.dart';

class TabBarContainer extends StatelessWidget {

  final DetailsPageBody widget;

  const TabBarContainer({
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              color: Colors.transparent,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    TabBar(
                      labelPadding: EdgeInsets.only(bottom: 15, top: 15),
                      indicatorColor: Colors.yellow.shade700,
                      labelColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.cyanAccent,
                      tabs: <Widget>[
                        Text("Info"),
                        Text("Video"),
                        Text("Reviews"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text("Plot Summary",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.3)),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          widget.bookObject.summary,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: YoutubePlayerView(),
              ),

              Center(
                child: Text("NO REVIEWS",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black54)),
              )
            ],
          ),
        ),
      ),
    );
  }
}