import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeaderboardView'),
        centerTitle: true,
      ),
      body: GridView.count(
        //physics: NeverScrollableScrollPhysics(),
        children: [
          for (var i = 0; i <10 ; i++)
            Image.asset("assets/images/numbers/number_00$i.png"),
        ],

        //Image.asset("assets/images/numbers/number_00$i.png"),
        crossAxisCount: 2,
      ),
    );
  }
}
