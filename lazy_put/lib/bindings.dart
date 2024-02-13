import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Lazily create the controller based on the app's theme mode.
    Get.lazyPut<BaseController>(
      () {
        if (Get.isDarkMode) {
          return DecrementController();
        } else {
          return IncrementController();
        }
      },
    );
  }
}
