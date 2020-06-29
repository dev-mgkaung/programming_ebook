import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/book_detail_page_body.dart';

class AuthorContainer extends StatelessWidget {
  final DetailsPageBody widget;

  const AuthorContainer({
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 0,
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(widget.bookObject.authorImg,
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.bookObject.author,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      StarRating(
                        rating: widget.bookObject.rating,
                        size: 20,
                        color: Colors.yellow.shade700,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.bookObject.rating.toString(),
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
