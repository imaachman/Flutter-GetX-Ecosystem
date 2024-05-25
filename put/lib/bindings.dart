import 'package:get/get.dart';

import 'controller.dart';

/// A binding class that injects different instances of the same controller.
class HomeBinding implements Bindings {
  /// Method to initialize the dependencies.
  @override
  void dependencies() {
    // Different instances of the same controller created using the tag.
    Get.put<Controller>(Controller(), tag: 'red');
    Get.put<Controller>(Controller(), tag: 'blue');
  }
}
