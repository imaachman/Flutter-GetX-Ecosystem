import 'package:bindings/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}
