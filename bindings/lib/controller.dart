import 'package:get/get.dart';

/// Controller class that manages the count.
class Controller extends GetxController {
  /// Reactive variable that stores the count.
  final RxInt count = 0.obs;

  /// Method that increments the count.
  void incrementCount() => count.value++;
}
