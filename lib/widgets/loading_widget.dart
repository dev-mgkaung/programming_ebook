import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class buildLoadingWidget extends StatelessWidget {
  bool _enabled = true;
  List<Color> mcolors = [Colors.blueAccent, Colors.blue, Colors.cyan];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, int) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.all(1),
                  child: ListTileShimmer(
                    colors: mcolors,
                    isRectBox: true,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
