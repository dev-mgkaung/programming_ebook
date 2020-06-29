import 'package:flutter/material.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/book_detail_page_body.dart';
import 'package:programmingebook/screens/bookdetail/local_widgets/category_box.dart';

class GenreContainer extends StatelessWidget {
  final DetailsPageBody widget;

  const GenreContainer({@required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryBox(
            category: "GENRE",
            categoryValue: widget.bookObject.genre,
            categoryIcon:
            "https://cdn3.vectorstock.com/i/thumb-large/93/62/psychology-icon-vector-15909362.jpg",
          ),
          SizedBox(
            width: 10,
          ),
          CategoryBox(
            category: "LANGUAGE",
            categoryValue: widget.bookObject.lanugage,
            categoryIcon:
            "https://cdn2.iconfinder.com/data/icons/translation-1/513/translation-translate-language-international-translating_2_copy_7-512.png",
          ),
          SizedBox(
            width: 10,
          ),
          CategoryBox(
            category: "AGE",
            categoryValue: widget.bookObject.age,
            categoryIcon:
            "https://image.flaticon.com/icons/png/512/31/31370.png",
          ),
        ],
      ),
    );
  }
}