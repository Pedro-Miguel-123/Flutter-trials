import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
      primaryColor: MyAppColors.lightBlue, brightness: Brightness.light);

  static final darkTheme = ThemeData(
      primaryColor: MyAppColors.darkBlue, brightness: Brightness.dark);
}
