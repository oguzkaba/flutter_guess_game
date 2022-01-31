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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(
              children: [
                Image.asset("assets/images/profile.png", scale: 1.5),
                Text(hc.playerName.value, style: TextStyle(fontSize: 30)),
              ],
            ),
          ),
          Obx(() => Container(
                child: Image.asset(
                    "assets/images/numbers/${numberlist[controller.selectedNumber.value]}",
                    scale: 0.5),
              )),
          Center(
              child: Container(
            width: Get.width * .8,
            height: Get.height * .6,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: [
                for (var i = 0; i < numberlist.length; i++)
                  Visibility(
                    visible: i == 9 ? false : true,
                    child: Center(
                        child: InkWell(
                      onTap: () => controller.selectedNumber.value = i,
                      child: Container(
                          child: Image.asset(
                              "assets/images/numbers/${numberlist[i]}",
                              scale: 1.5)),
                    )),
                  ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
