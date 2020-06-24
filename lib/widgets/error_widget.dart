import 'package:flutter/material.dart';

class buildErrorWidget extends StatelessWidget {
 final String error;
  const buildErrorWidget({Key key, this.error}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }
}
