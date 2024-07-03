import 'package:flutter/material.dart';
import 'package:to_do_app/constants/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeDataStyle = MyAppThemes.lightTheme;

  ThemeData get themeDataStyle => _themeDataStyle;

  set themeDataStyle(ThemeData themeData) {
    _themeDataStyle = themeData;
    notifyListeners();
  }

  void changeTheme() {
    themeDataStyle = (_themeDataStyle == MyAppThemes.lightTheme)
        ? MyAppThemes.darkTheme
        : MyAppThemes.lightTheme;
  }
}
