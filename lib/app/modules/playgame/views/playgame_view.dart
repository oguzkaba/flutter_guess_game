import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_game1/app/routes/app_pages.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/profile.png", scale: 1.5),
                Text(hc.playerName.value, style: TextStyle(fontSize: 30)),
                Obx(() => Text(
                    controller.counter.value == 1
                        ? "🌟"
                        : controller.counter.value == 2
                            ? "🌟🌟"
                            : controller.counter.value == 3
                                ? "🌟🌟🌟"
                                : "",
                    style: TextStyle(fontSize: 30)))
              ],
            ),
          ),
          Obx(() => Container(
                child: numberNListEasy[controller.selectedNumber.value] ==
                        controller.magicNumber.value.toString()
                    ? Column(
                        children: [
                          Text("KAZANDIN",
                              style:
                                  TextStyle(fontSize: 50, color: greenColor)),
                          IconButton(
                              onPressed: () => controller.reloadGame(),
                              icon: Icon(Icons.refresh, size: 30))
                        ],
                      )
                    : controller.counter.value == 0
                        ? Text.rich(TextSpan(
                            text: "Doğru Tahmin ",
                            style: TextStyle(fontSize: 25),
                            children: [
                                TextSpan(
                                    text:
                                        controller.magicNumber.value.toString(),
                                    style: TextStyle(
                                        fontSize: 100, color: logoRedColor)),
                                TextSpan(text: " Olmalıydı... ")
                              ]))
                        : controller.selectNumberList.isEmpty
                            ? SizedBox()
                            : Image.asset(
                                "assets/images/numbers/${numberList[controller.selectedNumber.value]}",
                                scale: 0.5),
              )),
          Center(
              child: Obx(() => Container(
                    width: numberNListEasy[controller.selectedNumber.value] ==
                            controller.magicNumber.value.toString()
                        ? double.infinity
                        : controller.counter.value == 0
                            ? double.infinity
                            : Get.width * .8,
                    height: Get.height * .6,
                    child: numberNListEasy[controller.selectedNumber.value] ==
                            controller.magicNumber.value.toString()
                        ? Image.asset("assets/images/rabbit_win.gif",
                            gaplessPlayback: false, fit: BoxFit.fitHeight)
                        : controller.counter.value == 0
                            ? Image.asset("assets/images/rabbit_lose.gif",
                                gaplessPlayback: true, fit: BoxFit.fitHeight)
                            : GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                children: [
                                  for (var i = 0;
                                      i < numberNListEasy.length;
                                      i++)
                                    Visibility(
                                      visible: i == 9 ? false : true,
                                      child: Center(
                                          child: InkWell(
                                        onTap: controller.selectNumberList
                                                .contains(i)
                                            ? null
                                            : () {
                                                controller
                                                    .selectedNumber.value = i;
                                                controller.selectNumberList
                                                    .add(i);
                                                controller.minus();
                                              },
                                        child: Container(
                                            width: Get.width * .2,
                                            height: Get.height * .1,
                                            decoration: BoxDecoration(
                                                color: controller
                                                        .selectNumberList
                                                        .contains(i)
                                                    ? Colors.grey
                                                    : hc.currentLevel.value ==
                                                            "easy"
                                                        ? greenColor
                                                        : hc.currentLevel
                                                                    .value ==
                                                                "normal"
                                                            ? orangeColor
                                                            : logoRedColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                numberNListEasy[i],
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
