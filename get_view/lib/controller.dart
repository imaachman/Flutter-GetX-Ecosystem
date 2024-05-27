import 'package:get/get.dart';

/// A controller class that manages the count. It has an observable [count] and
/// a method to increment the count.
class Controller extends GetxController {
  /// A reactive variable that stores the count.
  final RxInt count = 0.obs;

  /// Increments the count by 1.
  void incrementCount() => count.value++;
}
