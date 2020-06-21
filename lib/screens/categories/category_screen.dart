import 'package:flutter/cupertino.dart';
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
                padding: const EdgeInsets.only(left: 16, top: 6,bottom: 6),
                child: Text(recommend,style: Styles.mediumTextStyle),
              ),
            CategoryCarousalImage(),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 6,bottom: 6,right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(child: Text(browse_catgory,style: Styles.mediumTextStyle)),
                  FlatButton.icon(
                    onPressed: (){},
                    icon: const Icon(Icons.search,size: 16,color: Colors.orange,),
                    label: Text(search,style: TextStyle(color: Colors.orange,fontSize: 16,fontWeight: FontWeight.w800),),
                  )
                ],
              ),
            ),
          ],)
        ],
      ),
    );
  }
}
