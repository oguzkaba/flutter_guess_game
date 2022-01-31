import 'dart:math';

import 'package:flutter_game1/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class PlaygameController extends GetxController {
  final hc = Get.find<HomeController>();
  final selectedNumber = 0.obs;
  final magicNumber = 0.obs;
  final counter = 4.obs;

  @override
  void onInit() {
    playLevel();
    super.onInit();
  }

  void playLevel() {
    if (hc.currentLevel.value == "easy") {
      magicNumber.value = Random().nextInt(10);
      minus();
      print(magicNumber.value);
    } else if (hc.currentLevel.value == "normal") {
      magicNumber.value = Random().nextInt(21);
      minus();
      print(magicNumber.value);
    } else {
      magicNumber.value = Random().nextInt(41);
      minus();
      print(magicNumber.value);
    }
  }

  void minus() {
    counter.value -= 1;
  }

  void plus() {
    counter.value += 1;
  }
}
