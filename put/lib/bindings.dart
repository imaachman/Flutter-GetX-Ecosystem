import 'package:get/get.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Different instances of the same controller created using the tag.
    Get.put<BaseController>(BaseController(), tag: 'red');
    Get.put<BaseController>(BaseController(), tag: 'blue');
  }
}
