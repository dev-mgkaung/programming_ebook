import 'package:flutter/material.dart';

class Styles {
  static const mediumTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w900,
    color: Colors.deepOrange
  );

  static const defaultTextStyle = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w800,
      color: Colors.blue
  );

  static const notiTextStyle = TextStyle(
      fontSize: 8.0,
      fontWeight: FontWeight.w100,
      color: Colors.white
  );

  static TextStyle appBarTextStyleTheme(bool isDark) =>
      TextStyle(color: isDark ? Colors.white : Colors.black);
}