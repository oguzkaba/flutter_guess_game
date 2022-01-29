import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            backgroundColor: backColor,
            titleTextStyle: TextStyle(
                //color: lightAppBarTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        scaffoldBackgroundColor: Colors.white);
    // primaryTextTheme:
    //     TextTheme(bodyText1: TextStyle(color: lightTextColor)));
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith();
  }
}
