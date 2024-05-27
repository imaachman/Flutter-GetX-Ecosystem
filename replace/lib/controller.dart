import 'package:get/get.dart';

/// Base controller with a count value and a method to change it.
abstract class BaseController extends GetxController {
  /// Reactive variable to store the count value.
  final RxInt count = 0.obs;

  /// Change the count value.
  void changeCount();
}

/// Controller to increment the count value.
class IncrementController extends BaseController {
  /// Increment the count value.
  @override
  void changeCount() => count.value++;
}

/// Controller to decrement the count value.
class DecrementController extends BaseController {
  /// Decrement the count value.
  @override
  void changeCount() => count.value--;
}
