import 'package:flutter/material.dart';
import 'package:programmingebook/models/network_model/book/book_model.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/top_container.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/generic_container.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/author_container.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/tab_container.dart';

class DetailsPageBody extends StatefulWidget {

  final Book bookObject;
  DetailsPageBody(this.bookObject);

  @override
  _DetailsPageBodyState createState() => _DetailsPageBodyState();
}

class _DetailsPageBodyState extends State<DetailsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TopContainer(widget: widget),
                  AuthorContainer(widget: widget),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: GenreContainer(widget: widget),
                  ),
                  TabBarContainer(widget: widget),
                ],
              ),
              Positioned(
                left: 25,
                top: 20,
                child: Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(widget.bookObject.cover,
                        fit: BoxFit.contain),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}