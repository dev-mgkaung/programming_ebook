import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKitLoadingWidget extends StatelessWidget {
  final bool isImage;
  final int index;

  const SpinKitLoadingWidget({Key key, this.isImage, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (index == 0) {
      return SpinKitChasingDots(
        color: Theme.of(context).primaryColorDark,
      );
    } else {
      return SpinKitSquareCircle(
        color: Colors.cyan,
        size: 50.0,
      );
    }
  }
}
