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
    return SpinKitChasingDots(
      color: Theme
          .of(context)
          .primaryColorDark,
    );
  }
}
