import 'package:get/get.dart';

/// A controller that manages the count.
class Controller extends GetxController {
  /// Reactive variable that stores the count.
  final RxInt count = 0.obs;

  /// Increments the count by one.
  void incrementCount() => count.value++;
}
