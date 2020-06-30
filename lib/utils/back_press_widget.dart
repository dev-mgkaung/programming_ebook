import 'package:flutter/material.dart';
import '../routes.dart';

class BackPressIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.blueAccent,
        onPressed: () {
          PageRouter.goToBackScreen(context);
        });
  }
}
