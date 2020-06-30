import 'package:flutter/material.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/book_detail_page_body.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailsPageBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20, bottom: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xfff8f8f8), Colors.white]),
          border:
              Border(bottom: BorderSide(color: Color(0xfff0f0f0), width: 2))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                widget.bookObject.title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 16),
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
