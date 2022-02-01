import 'dart:math';

import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class PlaygameController extends GetxController {
  final hc = Get.find<HomeController>();

  final numberList = [].obs;
  final imageList = [].obs;
  final crossAxisCount=3.obs;
  final selectedNumber = 0.obs;
  final selectNumberList = [].obs;
  final selectColor = greenColor.obs;
  final magicNumber = 0.obs;
  final counter = 4.obs;
  final isGameOver = false.obs;

  @override
  void onInit() {
    crossAxisCount.value = 3;
    isGameOver.value = false;
    numberList.clear();
    imageList.clear();
    selectColor.value = greenColor;
    selectedNumber.value = -1;
    selectNumberList.clear();
    magicNumber.value = 0;
    counter.value = 4;
    playLevel();
    super.onInit();
  }

  void reloadGame() {
    onInit();
  }

  void playLevel() {
    if (hc.currentLevel.value == "easy") {
      crossAxisCount.value = 3;
      addNumberList(10);
      selectColor.value = greenColor;
      magicNumber.value = Random().nextInt(10);
      minus();
      print(magicNumber.value);
    } else if (hc.currentLevel.value == "normal") {
      crossAxisCount.value = 5;
      addNumberList(20);
      selectColor.value = orangeColor;
      magicNumber.value = Random().nextInt(20);
      minus();
      print(magicNumber.value);
    } else {
      crossAxisCount.value = 6;
      addNumberList(30);
      selectColor.value = logoRedColor;
      magicNumber.value = Random().nextInt(30);
      minus();
      print(magicNumber.value);
    }
  }

  void addNumberList(int number) {
    for (int i = 0; i < number; i++) {
      numberList.add(i);
    }
  }

  void minus() {
    counter.value -= 1;
  }

  void plus() {
    counter.value += 1;
  }

  void resultGameTour() {
    if (counter.value == 0) {
      isGameOver.value = true;
    } else {
      isGameOver.value = false;
    }
  }

  void selectNumber(int i) {
    selectedNumber.value = i;
    selectNumberList.add(i);
    minus();
    resultGameTour();
  }
}
