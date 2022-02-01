import 'package:get/get.dart';

import '../controllers/set_player_controller.dart';

class SetPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPlayerController>(
      () => SetPlayerController(),
    );
  }
}
