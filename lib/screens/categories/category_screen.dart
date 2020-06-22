import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/constraints.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/screens/categories/local_widgets/category_carousal_image.dart';
import 'local_widgets/browse_category_list.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CategoryScreen> {
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
                  Center(child: Text('browse'.tr().toString(),style: Styles.mediumTextStyle)),
                  FlatButton.icon(
                    onPressed: (){
                      setState(() {
                        EasyLocalization.of(context).locale= Locale('my');
                      });
                    },
                    icon: const Icon(Icons.search,size: 16,color: Colors.orange,),
                    label: Text('search'.tr().toString(),style: TextStyle(color: Colors.orange,fontSize: 16,fontWeight: FontWeight.w800),),
                  ),
                ],
              ),
            ),
            CategoryList(),
            SizedBox(
              height: 20,
            )
          ],)
        ],
      ),
    );
  }
}


