import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/network_model/popular/popular_book.dart';

class PopularList extends StatelessWidget {
  final List<PopularBook> popularlist;

  const PopularList({Key key, this.popularlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: popularlist.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            PopularListItemRow(popularlist[index], context));
  }

  Widget PopularListItemRow(PopularBook popularBook, BuildContext context) {
    return Card(
      elevation: 2,
      child: Center(
        child: Container(
          height: 85,
          padding: const EdgeInsets.all(2),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    popularBook.image,
                    fit: BoxFit.cover,
                    height: 81,
                    width: 68,
                  ),
                ),
                margin: EdgeInsets.only(right: 5),
              ),
              SizedBox(
                width: 5.0,
              ),
              Flexible(
                child: MergeSemantics(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        popularBook.bookname,
                        style: Styles.mediumTextStyle,
                      ),
                      SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          popularBook.desc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        popularBook.price,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
