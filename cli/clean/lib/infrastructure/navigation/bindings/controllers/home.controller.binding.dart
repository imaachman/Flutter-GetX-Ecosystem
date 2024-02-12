import 'package:get/get.dart';

import 'package:tamish/presentation/home/controllers/mycontroller_controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
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
