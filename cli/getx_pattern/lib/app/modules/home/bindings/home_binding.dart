import 'package:get/get.dart';

import 'package:aachman/app/modules/home/controllers/mycontroller_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MycontrollerController>(
      () => MycontrollerController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
