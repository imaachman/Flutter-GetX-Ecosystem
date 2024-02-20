import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // We inject IncrementController in the beginning.
    // And later, the user can replace it using switch.
    Get.put<BaseController>(IncrementController());
  }
}
