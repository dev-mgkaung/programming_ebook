import 'package:flutter/material.dart';
import 'package:programmingebook/models/category.dart';
import 'package:programmingebook/screens/categories/local_widgets/category_list_item_row.dart';
class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),
      child: Expanded(
                    child: new ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                     itemCount: categorylist.length,
                     shrinkWrap: true,
                     padding: new EdgeInsets.symmetric(vertical: 16.0),
                     itemBuilder: (context, index) => new CategoryListItemRow(categorylist[index]),
                )
      ),
    );
  }
}
