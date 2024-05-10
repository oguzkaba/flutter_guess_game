import 'package:flutter/material.dart';
import 'package:flutter_guess_game/app/global/constants.dart';
import 'package:flutter_guess_game/app/modules/home/controllers/home_controller.dart';
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
              flex: 4,
              child: _displaySelectBar(),
            ),
            Expanded(
              flex: 8,
              child: _entryNumberBar(),
            ),
            Obx(() => Expanded(
                flex: 1,
                child: controller.selectedNumber.value ==
                            controller.magicNumber.value ||
                        controller.counter.value != 1
                    ? SizedBox.shrink()
                    : _bottomQuestionBar()))
          ],
        ),
      ),
    );
  }

  Row _bottomQuestionBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: null,
            icon: Image.asset(
              "assets/images/help.gif",
            )),
        Text("Yardım almak istermisin..?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    );
  }

  Obx _entryNumberBar() {
    return Obx(() => SizedBox(
          width: (controller.selectedNumber.value ==
                      controller.magicNumber.value) ||
                  controller.isGameOver.value
              ? double.infinity
              : Get.width * .8,
          child: controller.selectedNumber.value == controller.magicNumber.value
              ? Image.asset("assets/images/rabbit_win.gif",
                  gaplessPlayback: false, fit: BoxFit.fitHeight)
              : controller.isGameOver.value
                  ? Image.asset("assets/images/rabbit_lose.gif",
                      gaplessPlayback: true, fit: BoxFit.fitHeight)
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.3,
                        crossAxisCount: controller.crossAxisCount.value,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
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
                                  color: controller.selectNumberList.contains(i)
                                      ? Colors.grey
                                      : controller.selectColor.value,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  controller.numberList[i].toString(),
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ));
                      },
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
              : controller.isGameOver.value
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
                          : Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Positioned(
                                  left: (Get.width / 2) - 123,
                                  top: 50,
                                  child: Image.asset(
                                      "assets/images/numbers/${numberList[(controller.selectedNumber.value ~/ 10).toInt()]}",
                                      scale: 0.7),
                                ),
                                Positioned(
                                  left: (Get.width / 2) - 28,
                                  top: 50,
                                  child: Image.asset(
                                      "assets/images/numbers/${numberList[(controller.selectedNumber.value % (10 * (controller.selectedNumber.value ~/ 10))).toInt()]}",
                                      scale: 0.7),
                                ),
                              ],
                            ),
        ));
  }

  Padding _topInfoBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/profile.png", scale: 1.5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hc.playerName.value,
                            style: TextStyle(fontSize: 20)),
                        Obx(() => Text(
                            "Toplam Puan: ${controller.totalPoints.value.toString()}",
                            style: TextStyle(color: Colors.lightBlue)))
                      ],
                    ),
                  ],
                ),
                Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(controller.star.value,
                              style: TextStyle(fontSize: 20)),
                          Text("Puan: ${controller.point.value.toString()}",
                              style: TextStyle(fontSize: 20))
                        ]))
              ],
            ),
          ),
          Expanded(
              child: SizedBox(
                  width: Get.width * .9, child: Divider(color: logoLineColor))),
        ],
      ),
    );
  }
}
