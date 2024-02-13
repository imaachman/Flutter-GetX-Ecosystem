import 'package:get/get.dart';

class Controller extends GetxController {
  final RxInt count = 0.obs;

  void incrementCount() => count.value++;
}
