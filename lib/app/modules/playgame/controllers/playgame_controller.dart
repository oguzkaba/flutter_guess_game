import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_guess_game/app/global/constants.dart';
import 'package:flutter_guess_game/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class PlaygameController extends GetxController {
  final hc = Get.find<HomeController>();
  late Timer _timer;

  final numberList = [].obs;
  final imageList = [].obs;
  final crossAxisCount = 3.obs;
  final selectedNumber = 0.obs;
  final selectNumberList = [].obs;
  final selectColor = greenColor.obs;
  final magicNumber = 0.obs;
  final counter = 0.obs;
  final isGameOver = false.obs;
  final star = "".obs;
  final helpMe = false.obs;
  final point = 0.obs;
  final totalPoints = 0.obs;

  @override
  void onInit() {
    point.value = 0;
    crossAxisCount.value = 3;
    isGameOver.value = false;
    numberList.clear();
    imageList.clear();
    selectColor.value = greenColor;
    selectedNumber.value = -1;
    selectNumberList.clear();
    magicNumber.value = 0;
    counter.value = 0;
    star.value = "";
    playLevel();
    super.onInit();
  }

  void reloadGame() {
    onInit();
  }

  void pointCalculate() {
    switch (hc.currentLevel.value) {
      case "easy":
        point.value = counter.value * 5;
        break;
      case "normal":
        point.value = counter.value * 10;
        break;
      case "hard":
        point.value = counter.value * 15;
        break;
      default:
    }
    if (selectedNumber.value == magicNumber.value) {
      totalPoints.value += point.value;
    }
  }

  void playLevel() {
    if (hc.currentLevel.value == "easy") {
      crossAxisCount.value = 3;
      counter.value = 2;
      star.value = "🌟🌟";
      addNumberList(10);
      selectColor.value = greenColor;
      magicNumber.value = Random().nextInt(10);
      print('magicNumber is: ${magicNumber.value}');
    } else if (hc.currentLevel.value == "normal") {
      crossAxisCount.value = 4;
      counter.value = 3;
      star.value = "🌟🌟🌟";
      addNumberList(20);
      selectColor.value = orangeColor;
      magicNumber.value = Random().nextInt(20);
      print('magicNumber is: ${magicNumber.value}');
    } else {
      crossAxisCount.value = 5;
      counter.value = 4;
      star.value = "🌟🌟🌟🌟";
      addNumberList(30);
      selectColor.value = logoRedColor;
      magicNumber.value = Random().nextInt(30);
      print('magicNumber is: ${magicNumber.value}');
    }
    pointCalculate();
  }

  void addNumberList(int number) {
    for (int i = 0; i < number; i++) {
      numberList.add(i);
    }
  }

  void minus() {
    star.value = "";
    for (var i = 1; i < counter.value; i++) {
      star.value += "🌟";
    }
    if (counter.value == 0) {
      point.value = 0;
    } else {
      point.value = point.value - (point.value ~/ counter.value);
    }
    counter.value -= 1;
  }

  void plus() {
    counter.value += 1;
  }

  void resultGameTour() {
    if (counter.value == 0) {
      showDialog(
          context: Get.context!,
          builder: (BuildContext builderContext) {
            _timer = Timer(Duration(seconds: 5), () {
              Get.back();
            });

            return AlertDialog(
              title: Text("Yeni bir şans..?"),
              content: SizedBox(
                height: Get.height * .1,
                child: Center(
                  child: IconButton(
                    iconSize: Get.height * .1,
                    onPressed: () {
                      counter.value = 1;
                      star.value = "🌟";
                      pointCalculate();
                      isGameOver.value = false;
                      _timer.cancel();
                      Get.back();
                    },
                    icon: Image.asset("assets/images/extra_life.gif"),
                  ),
                ),
              ),
              actions: [
                FAProgressBar(
                  progressColor: logoRedColor,
                  backgroundColor: Colors.grey.shade100,
                  animatedDuration: Duration(seconds: 5),
                  currentValue: 100,
                ),
              ],
            );
          }).then((value) {
        if (counter.value == 0) {
          isGameOver.value = true;
          counter.value == 0;
          clearCache();
          star.value = "";
          dispose();

          //hc.totalPoints.value = totalPoints.value;
          //reloadGame();
          //Get.back();
        }
        if (_timer.isActive) {
          _timer.cancel();
        }
      });
    } else {
      isGameOver.value = false;
    }
  }

  void selectNumber(int i) {
    selectedNumber.value = i;
    selectNumberList.add(i);
    if (selectedNumber.value != magicNumber.value) {
      minus();
    } else {
      totalPoints.value += point.value;
    }
    resultGameTour();
  }

  void clearCache() {
    imageCache.clearLiveImages();
  }
}
