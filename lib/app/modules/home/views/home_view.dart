import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      // appBar: AppBar(
      //   title: Text('Tahmin ET..!'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              vPaddingM,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _levelContainer(greenColor, "Kolay"),
                  _levelContainer(orangeColor, "Orta"),
                  _levelContainer(logoRedColor, "Zor")
                ],
              ),
              vPaddingM,
              Padding(
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
                          width: Get.width * .9,
                          child: Divider(color: logoLineColor)),
                      ListTile(
                        leading: RotationTransition(
                            turns: AlwaysStoppedAnimation(8 / 9),
                            child: Image.asset("assets/images/gamepad.png",
                                scale: 2)),
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
              ),
              vPaddingM,
              Container(
                  width: Get.width * .5,
                  height: Get.height * .08,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: greenColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () => Get.toNamed(Routes.LEADERBOARD),
                      child: Text("BAŞLAT",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.currentPage.value,
              selectedItemColor: logoRedColor,
              unselectedItemColor: unSelectBottomButton,
              onTap: (value) => controller.currentPage.value = value,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Giriş"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.leaderboard), label: "Liderlik"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_rounded), label: "Can"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Ayarlar"),
              ])),
    );
  }

  Widget _levelContainer(Color color, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width * .2,
        height: Get.height * .1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          // boxShadow: [
          //   BoxShadow(color: Colors.redAccent, spreadRadius: 3),
          // ],
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
