import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/models/network_model/category/category_book.dart';
import 'package:programmingebook/screens/categories/blocs/category_view_model.dart';
import 'package:programmingebook/services/base/api_stream_builder.dart';
import 'package:programmingebook/services/base/base_view.dart';
import 'package:programmingebook/widgets/base_screen_mixin.dart';
import 'package:programmingebook/widgets/error_widget.dart';
import 'package:programmingebook/widgets/loading_widget.dart';
import '../../constraints/styles.dart';
import '../../screens/categories/local_widgets/category_carousal_image.dart';
import 'package:programmingebook/screens/categories/local_widgets/category_list_item.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CategoryScreen> with BaseScreenMixin {

  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryViewModel>(
        onModelReady: (CategoryViewModel categoryViewModel) {
      if (categoryViewModel.categoryBookList == null) {
        categoryViewModel.fetchCategoryList();
      }
      onConnectionChange((value) {
        print(value);
        if (categoryViewModel.categoryBookList == null && value) {
          categoryViewModel.fetchCategoryList();
        }
      });
    }, builder: (BuildContext context, CategoryViewModel categoryViewModel,
            Widget child) {
      return RefreshIndicator(
          onRefresh: () => categoryViewModel.fetchCategoryList(),
          child: Expanded(
            child: ListView(physics: ClampingScrollPhysics(), children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 6, bottom: 6),
                    child: Text(StringsConstants.recommend,
                        style: Styles.mediumTextStyle),
                  ),
                  CategoryCarousalImage(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 6, bottom: 6, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                            child: Text('browse'.tr().toString(),
                                style: Styles.mediumTextStyle)),
                        FlatButton.icon(
                          onPressed: () {
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 16,
                            color: Colors.orange,
                          ),
                          label: Text(
                            'search'.tr().toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ApiStreamBuilder<List<CategoryBook>>(
                    stream: categoryViewModel.apiDataSinkStream,
                    loadingWidget: (value) {
                      return buildLoadingWidget();},
                    errorWidget: (value) {
                      return buildErrorWidget(
                        errorMessage: value.toString(),
                        onRetryPressed: () => categoryViewModel.fetchCategoryList(),
                      );
                    },
                    dataWidget: (value) {
                      return CategoryList(categorylist: value);},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            ]),
          ));
    });
  }
}
