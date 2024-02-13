import 'package:bindings/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Unique instances for different list items.
    Get.create<Controller>(() => Controller());

    // Seperate instance shared among all the widgets.
    // It is used to display the total.
    Get.put<Controller>(Controller(), tag: 'total');
  }
}
