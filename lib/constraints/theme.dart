import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
        brightness: Brightness.light,
      //  primarySwatch: Colors.deepOrange,
       // accentColor: Colors.pink,
     //   scaffoldBackgroundColor: Colors.white,
    //    backgroundColor: Colors.white,
       // cardColor: AppColors.cardWhite,
       // dividerColor: AppColors.dividerColor,
//        appBarTheme: AppBarTheme(
//        color: AppColors.white,
//        brightness: Brightness.light,
//        iconTheme: IconThemeData(color: AppColors.black)),
//        snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.primaryColor)
       );

ThemeData dark = ThemeData(
        brightness: Brightness.dark,
       // primarySwatch: Colors.green,
    //    accentColor: Colors.pink,
      //  scaffoldBackgroundColor: Colors.black,
        //backgroundColor: Colors.black,
      //  cardColor: AppColors.cardWhite,
     //   dividerColor: AppColors.dividerColor,
//        appBarTheme: AppBarTheme(
//        color: AppColors.black,
//        brightness: Brightness.dark,
//        iconTheme: IconThemeData(color: AppColors.black)),
//        snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.primaryColor)
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
