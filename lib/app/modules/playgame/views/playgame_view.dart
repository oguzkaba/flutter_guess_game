import 'package:flutter/material.dart';
import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../controllers/playgame_controller.dart';

class PlaygameView extends GetView<PlaygameController> {
  final hc = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: _topInfoBar(),
            ),
            Expanded(
              flex: 3,
              child: _displaySelectBar(),
            ),
            Expanded(
              flex: 6,
              child: _entryNumberBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryNumberBar() {
    return Obx(() => Container(
          width: controller.selectedNumber.value == controller.magicNumber.value
              ? double.infinity
              : controller.counter.value == 0
                  ? double.infinity
                  : Get.width * .8,
          height: Get.height * .6,
          child: controller.selectedNumber.value == controller.magicNumber.value
              ? Image.asset("assets/images/rabbit_win.gif",
                  gaplessPlayback: false, fit: BoxFit.fitHeight)
              : controller.isGameOver.value
                  ? Image.asset("assets/images/rabbit_lose.gif",
                      gaplessPlayback: true, fit: BoxFit.fitHeight)
                  : Align(
                      alignment: Alignment.center,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: controller.crossAxisCount.value,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: controller.numberList.length,
                        itemBuilder: (context, i) {
                          return Center(
                              child: InkWell(
                            onTap: controller.selectNumberList.contains(i)
                                ? null
                                : () => controller.selectNumber(i),
                            child: Container(
                                width: Get.width * .2,
                                height: Get.height * .1,
                                decoration: BoxDecoration(
                                    color:
                                        controller.selectNumberList.contains(i)
                                            ? Colors.grey
                                            : controller.selectColor.value,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    controller.numberList[i].toString(),
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ));
                        },
                      ),
                    ),
        ));
  }

  Obx _displaySelectBar() {
    return Obx(() => Container(
          child: controller.selectedNumber.value == controller.magicNumber.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("KAZANDIN",
                        style: TextStyle(fontSize: 50, color: greenColor)),
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
                              text: controller.magicNumber.value.toString(),
                              style: TextStyle(
                                  fontSize: 100, color: logoRedColor)),
                          TextSpan(text: " Olmalıydı... ")
                        ]))
                  : controller.selectNumberList.isEmpty &&
                          controller.selectedNumber.value == -1
                      ? SizedBox.shrink()
                      : controller.selectedNumber.value < 10
                          ? Image.asset(
                              "assets/images/numbers/${numberList[controller.selectedNumber.value]}",
                              scale: 0.7)
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/numbers/${numberList[(controller.selectedNumber.value ~/ 10).toInt()]}",
                                    scale: 0.7),
                                Image.asset(
                                    "assets/images/numbers/${numberList[(controller.selectedNumber.value % (10*(controller.selectedNumber.value ~/ 10))).toInt()]}",
                                    scale: 0.7),
                              ],
                            ),
        ));
  }

  Padding _topInfoBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/profile.png", scale: 1.5),
              Text(hc.playerName.value, style: TextStyle(fontSize: 30)),
            ],
          ),
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
    );
  }
}
