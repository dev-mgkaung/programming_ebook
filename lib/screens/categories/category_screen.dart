import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/categories/local_widgets/category_carousal_image.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 5,bottom: 5),
                child: Text(recommend,style: Styles.mediumTextStyle),
              ),
            CategoryCarousalImage(),
          ],)
        ],
      ),
    );
  }
}
