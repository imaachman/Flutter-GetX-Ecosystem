import 'package:get/get.dart';

/// Controller class that manages the count.
class Controller extends GetxController {
  final RxInt count = 0.obs;

  void incrementCount() => count.value++;
}
