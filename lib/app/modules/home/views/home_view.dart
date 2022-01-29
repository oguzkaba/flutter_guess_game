import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';

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
      body: Center(
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
                width: Get.width * .9, child: Divider(color: mainTextColor)),
            vPaddingM,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _levelContainer(greenColor, "Kolay"),
                _levelContainer(Colors.yellow, "Orta"),
                _levelContainer(logoRedColor, "Zor")
              ],
            ),
            vPaddingM,
            GridView.builder(
              itemCount: 10,
              itemBuilder: (context, i) =>
                  Image.asset("assets/images/numbers/number_00$i.png"),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
                    onPressed: () {},
                    child: Text("BAŞLAT",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))))
          ],
        ),
      ),
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
          style: TextStyle(color: mainTextColor, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
