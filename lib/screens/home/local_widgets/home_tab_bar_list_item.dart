import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/models/network_model/book/book_model.dart';
import 'package:programmingebook/screens/bookdetail/book_detail_page.dart';
import 'package:programmingebook/widgets/spinKit_loading_widget.dart';
import '../../../routes.dart';

class DummyList extends StatelessWidget {
  final List<String> dummylist;
  const DummyList({Key key, this.dummylist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(right: 6),
        itemCount: dummylist.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
              margin: EdgeInsets.only(right: 10, bottom: 5, left: 5),
              elevation: 3,
              child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    PageRouter.gotoNextPage(
                        context, BookDetailPage(booklist.books[0]));
                  },
                  child: Container(
                    width: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: dummylist[index],
                        placeholder: (context, url) =>
                            SpinKitLoadingWidget(isImage: false, index: 0),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/onboard3.png",
                          fit: BoxFit.cover,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )));
        });
  }
}
