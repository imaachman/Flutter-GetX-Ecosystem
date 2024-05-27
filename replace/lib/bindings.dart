import 'package:get/get.dart';

import 'controller.dart';

/// Binding to inject the controller in the home page.
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // We inject IncrementController in the beginning.
    // And later, the user can replace it using the switch.
    Get.put<BaseController>(IncrementController());
  }
}
