import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Different instances of the same controller created using the tag.
    Get.put<Controller>(Controller(), tag: 'red');
    Get.put<Controller>(Controller(), tag: 'blue');
  }
}
