import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/styles.dart';
import 'package:programmingebook/models/category.dart';
import 'package:programmingebook/widgets/spinKit_loading_widget.dart';

class CategoryListItemRow extends StatelessWidget {
  final Category category;

  CategoryListItemRow(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(right: 7, bottom: 10),
          height: 81,
          padding: const EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width - 50,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
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
                margin: EdgeInsets.only(right: 5),
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
