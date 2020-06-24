import 'package:flutter/material.dart';
import 'package:programmingebook/models/category/category_model.dart';
import 'package:programmingebook/models/category/category_response.dart';
import 'package:programmingebook/screens/categories/blocs/category_bloc.dart';
import 'package:programmingebook/screens/categories/local_widgets/category_list_item_row.dart';
import 'package:programmingebook/widgets/error_widget.dart';
import 'package:programmingebook/widgets/loading_widget.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    categoryBloc..getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        //margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: StreamBuilder<CategoryResponse>(
          stream: categoryBloc.subject.stream,
          builder: (context, AsyncSnapshot<CategoryResponse> snapShot) {
            if (snapShot.hasData) {
              if (snapShot.data.error != null &&
                  snapShot.data.error.length > 0) {
                return buildErrorWidget(error: snapShot.data.error);
              }
              return buildCategoryWidget(snapShot.data);
            } else if (snapShot.hasError) {
              return buildErrorWidget(error: snapShot.data.error);
            } else {
              return buildLoadingWidget();
            }
          },
        ));
  }

  Widget buildCategoryWidget(CategoryResponse data) {
    List<CategoryModel> categorylist = data.results;
    return Expanded(
        child: new ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categorylist.length,
      shrinkWrap: true,
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      itemBuilder: (context, index) =>
          new CategoryListItemRow(categorylist[index]),
    ));
  }
}
