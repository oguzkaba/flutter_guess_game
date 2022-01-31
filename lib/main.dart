import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game1/app/global/constants.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.grey, statusBarColor: backColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Themes.lightTheme(),
    );
  }
}
