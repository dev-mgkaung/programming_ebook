import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:programmingebook/constraints/strings.dart';
import 'package:programmingebook/constraints/styles.dart';

class HomePopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, top: 10),
          child: Text(popular_label, style: Styles.mediumTextStyle),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10,bottom: 20),
              physics:const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                "https://m.media-amazon.com/images/I/51xhZUew9PL._SX260_.jpg",
                                fit: BoxFit.cover,
                                height: 81,
                                width: 68,
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
                                    'Book Name',
                                    style: Styles.mediumTextStyle,
                                  ),
                                  SizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      'The overflowing RenderFlex has an orientation of Axis.horizontalThe overflowing RenderFlex has an orientation of Axis.horizontal..',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '30000 Ks',
                                    style: TextStyle(
                                    color: Colors.red,
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
              }),
        )
      ],
    );
  }
}
