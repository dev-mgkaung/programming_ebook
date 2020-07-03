import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple,
  accentColor: Colors.amber,
  appBarTheme: AppBarTheme(
      color: Colors.white,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black),
        headline6: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      iconTheme: IconThemeData(color: Colors.black)),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.red,
  accentColor: Colors.blue,
  appBarTheme: AppBarTheme(
      color: Colors.black12,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.white),
        headline6: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white)),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
