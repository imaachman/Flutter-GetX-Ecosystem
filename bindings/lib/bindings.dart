import 'package:bindings/controller.dart';
import 'package:get/get.dart';

/// Bindings class that initializes the dependencies for the home page.
class HomeBinding implements Bindings {
  /// Method that initializes the dependencies.
  @override
  void dependencies() {
    // Initialize [Controller] to be used in the home page route.
    Get.put<Controller>(Controller());
  }
}
