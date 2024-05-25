import 'package:get/get.dart';

import 'controller.dart';

/// Bindings for the home page.
/// Lazily injects the controller based on the app's theme.
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Lazily inject the controller based on the app's theme mode.
    Get.lazyPut<BaseController>(
      () {
        // If the app's theme is dark, inject an instance of
        // [DecrementController].
        if (Get.isDarkMode) {
          return DecrementController();
        } else {
          // Else if the theme is light, inject an instance of
          // [IncrementController].
          return IncrementController();
        }
      },
    );
  }
}
