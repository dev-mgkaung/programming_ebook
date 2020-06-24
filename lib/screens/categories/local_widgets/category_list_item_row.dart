import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/category/category_model.dart';
import 'package:programmingebook/widgets/spinKit_loading_widget.dart';

class CategoryListItemRow extends StatelessWidget {
  final CategoryModel category;

  CategoryListItemRow(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Center(
        child: Container(
          height: 80,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width ,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5),
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: category.image,
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
                        category.name,
                        style: Styles.mediumTextStyle,
                      ),
                      SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          category.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        category.total,
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
