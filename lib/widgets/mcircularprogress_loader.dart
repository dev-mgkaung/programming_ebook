import 'package:flutter/material.dart';
import 'package:programmingebook/constraints/colors.dart';

class CustomProgressLoader extends StatelessWidget {
  final double width;
  final double height;

  CustomProgressLoader(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(kCircularStopAnimationColor),
              strokeWidth: 5.0, backgroundColor: kCircularProgressColor),
        ),
      ),
    );
  }
}
