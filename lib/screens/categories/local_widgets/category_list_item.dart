import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/network_model/category/category_book.dart';
import 'package:programmingebook/widgets/spinKit_loading_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryBook> categorylist;

  const CategoryList({Key key, this.categorylist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: new ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categorylist.length,
            shrinkWrap: true,
            padding: new EdgeInsets.symmetric(vertical: 2.0),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FlipAnimation(
                    child: CategoryListItemRow(categorylist[index], context),
                  ),
                ),
              );
            }));
  }

  Widget CategoryListItemRow(CategoryBook categoryBook, BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Container(
          height: 85,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(1),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: categoryBook.image,
                    placeholder: (context, url) =>
                        SpinKitLoadingWidget(isImage: false, index: 0),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/onboard3.png",
                      fit: BoxFit.cover,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Flexible(
                child: MergeSemantics(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        categoryBook.name,
                        style: Styles.mediumTextStyle,
                      ),
                      SizedBox(height:2),
                      Flexible(
                        child: AutoSizeText(
                          categoryBook.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.0),
                          maxLines: 2,
                        )),
                      SizedBox(height: 5),
                      Text(
                        categoryBook.total,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
