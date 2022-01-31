import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';

class Themes {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        cardColor: cardTopColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            backgroundColor: backColor,
            titleTextStyle: TextStyle(
                //color: lightAppBarTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        scaffoldBackgroundColor: backColor);
    // primaryTextTheme:
    //     TextTheme(bodyText1: TextStyle(color: lightTextColor)));
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith();
  }
}
