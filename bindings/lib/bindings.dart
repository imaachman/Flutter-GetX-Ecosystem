import 'package:bindings/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Initialize the dependencies in the bindings class.
    Get.put<Controller>(Controller());
  }
}
