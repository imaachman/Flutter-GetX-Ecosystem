import 'package:get/get.dart';
import 'package:getx_service/service.dart';

class Controller extends GetxController {
  final Service service = Get.find<Service>();

  late String name;
  late String color;

  @override
  void onInit() {
    super.onInit();
    name = service.name ?? '';
    color = service.color ?? '';
  }

  void changeName(String newName) {
    name = newName;
    update();
    service.name = newName;
  }

  void changeColor(String newColor) {
    color = newColor;
    update();
    service.color = newColor;
  }
}
