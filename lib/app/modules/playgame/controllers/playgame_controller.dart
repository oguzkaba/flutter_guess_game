import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_game1/app/global/constants.dart';
import 'package:flutter_game1/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class PlaygameController extends GetxController {
  final hc = Get.find<HomeController>();

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
    counter.value = 0;
    star.value = "";
    playLevel();
    super.onInit();
  }

  void reloadGame() {
    onInit();
  }

  void playLevel() {
    if (hc.currentLevel.value == "easy") {
      crossAxisCount.value = 3;
      counter.value = 2;
      star.value = "🌟🌟";
      addNumberList(10);
      selectColor.value = greenColor;
      magicNumber.value = Random().nextInt(10);
      print(magicNumber.value);
    } else if (hc.currentLevel.value == "normal") {
      crossAxisCount.value = 5;
      counter.value = 4;
      star.value = "🌟🌟🌟🌟";
      addNumberList(20);
      selectColor.value = orangeColor;
      magicNumber.value = Random().nextInt(20);
      print(magicNumber.value);
    } else {
      crossAxisCount.value = 6;
      counter.value = 6;
      star.value = "🌟🌟🌟🌟🌟🌟";
      addNumberList(30);
      selectColor.value = logoRedColor;
      magicNumber.value = Random().nextInt(30);
      print(magicNumber.value);
    }
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
    print(star.value);
    counter.value -= 1;
  }

  void plus() {
    counter.value += 1;
  }

  void resultGameTour() {
    if (counter.value == 0) {
      Get.dialog(
        AlertDialog(
          title: Text("Yeni bir şans..?"),
          content: FAProgressBar(
            progressColor: logoRedColor,
            backgroundColor: Colors.grey.shade100,
            animatedDuration: Duration(seconds: 3),
            currentValue: 100,
          ),
          actions: [
            Center(
              child: IconButton(
                iconSize: 80,
                onPressed: () {
                  counter.value = 1;
                  star.value = "🌟";
                  isGameOver.value = false;
                  Get.back();
                },
                icon: Image.asset("assets/images/extra_life.gif"),
              ),
            )
          ],
        ),
        barrierDismissible: false,
      );
      Future.delayed(Duration(seconds: 3)).then((value) {
        if (counter.value == 0) {
          isGameOver.value = true;
          counter.value == 0;
          clearCache();
          star.value = "";
          dispose();
          Get.back();
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
    }
    resultGameTour();
  }

  void clearCache() {
    imageCache!.clearLiveImages();
  }
}
