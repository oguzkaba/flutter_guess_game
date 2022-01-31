import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../controllers/playgame_controller.dart';

class PlaygameView extends GetView<PlaygameController> {
  final hc = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/profile.png", scale: 1.5),
                Text(hc.playerName.value, style: TextStyle(fontSize: 30)),
                Obx(() => Text("Kalan Hak: ${controller.counter.value}"))
              ],
            ),
          ),
          Obx(() => Container(
                child: numberNList[controller.selectedNumber.value] ==
                        controller.magicNumber.value.toString()
                    ? Text("KAZANDIN",
                                style: TextStyle(
                                    fontSize: 50,color: greenColor))
                    : controller.counter.value == 0
                        ? Text.rich(TextSpan(text: "Doğru Tahmin ", children: [
                            TextSpan(
                                text: controller.magicNumber.value.toString(),
                                style: TextStyle(
                                    fontSize: 100, color: logoRedColor)),
                            TextSpan(text: " olmalıydı... ")
                          ]))
                        : Image.asset(
                            "assets/images/numbers/${numberList[controller.selectedNumber.value]}",
                            scale: 0.5),
              )),
          Center(
              child: Obx(() => Container(
                    width:numberNList[controller.selectedNumber.value] ==
                            controller.magicNumber.value.toString()
                        ? double.infinity: Get.width * .8,
                    height: Get.height * .6,
                    child: numberNList[controller.selectedNumber.value] ==
                            controller.magicNumber.value.toString()
                        ? Image.asset("assets/images/bravo.gif",fit: BoxFit.contain)
                        : controller.counter.value == 0
                            ? Text("Hakkın Bitti..!")
                            : GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                children: [
                                  for (var i = 0; i < numberNList.length; i++)
                                    Visibility(
                                      visible: i == 9 ? false : true,
                                      child: Center(
                                          child: InkWell(
                                        onTap: () {
                                          controller.selectedNumber.value = i;
                                          controller.minus();
                                        },
                                        child: Container(
                                            width: Get.width * .2,
                                            height: Get.height * .1,
                                            decoration: BoxDecoration(
                                                color: hc.currentLevel.value ==
                                                        "easy"
                                                    ? greenColor
                                                    : hc.currentLevel.value ==
                                                            "normal"
                                                        ? orangeColor
                                                        : logoRedColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                numberNList[i],
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                      )),
                                    ),
                                ],
                              ),
                  ))),
        ],
      ),
    );
  }
}
