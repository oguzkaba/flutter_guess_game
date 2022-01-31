import 'package:get/get.dart';

import '../controllers/playgame_controller.dart';

class PlaygameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaygameController>(
      () => PlaygameController(),
    );
  }
}
