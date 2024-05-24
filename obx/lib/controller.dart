import 'package:get/get.dart';

/// Controller class that manages the counter value.
class Controller extends GetxController {
  /// Counter value that can be observed.
  final RxInt count = 0.obs;

  /// Increments the counter value.
  void incrementCount() => count.value++;
}
