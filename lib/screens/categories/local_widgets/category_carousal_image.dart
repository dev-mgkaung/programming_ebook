import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:programmingebook/constraints/constraints.dart';
class CategoryCarousalImage extends StatefulWidget {
  @override
  _CategoryCarousalImageState createState() => _CategoryCarousalImageState();
}

class _CategoryCarousalImageState extends State<CategoryCarousalImage> {
  int _current=0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(
                    images[index],
                  ),
                  fit: BoxFit.fill,
                )
              ),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: images.length,
          layout: SwiperLayout.DEFAULT,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}

