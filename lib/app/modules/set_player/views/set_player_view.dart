import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/set_player_controller.dart';

class SetPlayerView extends GetView<SetPlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetPlayerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SetPlayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
