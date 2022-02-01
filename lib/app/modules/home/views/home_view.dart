
import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              vPaddingXL,
              Text(
                'TAHMİN ET ',
                style: TextStyle(
                    fontSize: 40,
                    color: mainTextColor,
                    fontWeight: FontWeight.bold),
              ),
              vPaddingS,
              Image.asset("assets/images/logo_magic.png"),
              vPaddingS,
              SizedBox(
                  width: Get.width * .9, child: Divider(color: logoLineColor)),
              vPaddingS,
              SizedBox(
                width: Get.width * .6,
                height: Get.height * .05,
                child: TextFormField(
                    style: TextStyle(
                        color: mainTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "İsim",
                      border: InputBorder.none,
                    ),
                    onChanged: (name) => controller.playerName.value = name),
              ),
              vPaddingM,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _levelContainer(greenColor, "Kolay", "easy"),
                  _levelContainer(orangeColor, "Normal", "normal"),
                  _levelContainer(logoRedColor, "Zor", "hard")
                ],
              ),
              vPaddingM,
              _infoTable(),
              vPaddingM,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _mainButton(
                      "assets/images/podium.png",
                      "Leaderboard",
                      () => Get.toNamed(Routes.LEADERBOARD),
                      orangeColor,
                      18,
                      1.5),
                  hPaddingS,
                  _mainButton("assets/images/play_games.png", "Başlat",
                      () => Get.toNamed(Routes.PLAYGAME), greenColor, 23, 1.1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _mainButton(String url, String label, Function() onClick,
      Color color, double size, double scale) {
    return Container(
        width: Get.width * .45,
        height: Get.height * .08,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: onClick,
          label: Text(label,
              style: TextStyle(
                  fontSize: size,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          icon: Image.asset(url, scale: scale),
        ));
  }

  Padding _infoTable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("assets/images/cup100.png", width: 80),
                  hPaddingS,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Puan",
                        style: TextStyle(
                            fontSize: 20,
                            color: mainTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1000",
                        style: TextStyle(
                            fontSize: 45,
                            color: mainTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
                width: Get.width * .9, child: Divider(color: logoLineColor)),
            ListTile(
              leading: RotationTransition(
                  turns: AlwaysStoppedAnimation(8 / 9),
                  child: Image.asset("assets/images/gamepad.png", scale: 2)),
              title: Text("Son Oyun Girişi"),
              subtitle: Text("Pazartesi 19:30 - Türkiye",
                  style: TextStyle(
                      fontSize: 20,
                      color: mainTextColor,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  Widget _levelContainer(Color color, String text, String level) {
    return Obx(
      () => InkWell(
          key: GlobalKey(),
          onTap: () {
            controller.currentLevel.value = level;
            print(controller.currentLevel.value);
          },
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: controller.currentLevel.value == level
                    ? Get.width * .25
                    : Get.width * .18,
                height: controller.currentLevel.value == level
                    ? Get.height * .12
                    : Get.height * .1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.currentLevel.value == level
                      ? color
                      : color.withOpacity(0.3),
                  boxShadow: controller.currentLevel.value == level
                      ? [
                          BoxShadow(
                              color: color.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 2))
                        ]
                      : [],
                ),
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ))),
    );
  }
}
