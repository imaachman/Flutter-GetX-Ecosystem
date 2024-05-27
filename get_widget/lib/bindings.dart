import 'package:get/get.dart';

import 'controller.dart';

/// A binding class that injects the controller in two different ways.
///
/// Using [Get.create], a new instance of the controller is created for each
/// widget that uses it. This is used to display the quantity of each item in
/// the shopping cart.
///
/// Using [Get.put], a seperate instance is created that is shared among all the
/// widgets. This is used to display the total number of items in the shopping
/// cart.
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Inject a new instance of the controller for each widget that uses it.
    // It is used to display the quantity of each item in the shopping cart.
    Get.create<Controller>(() => Controller());

    // Inject a seperate instance that is shared among all the widgets.
    // It is used to display the total number of items in the shopping cart.
    Get.put<Controller>(Controller(), tag: 'total');
  }
}
