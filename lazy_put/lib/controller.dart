import 'package:get/get.dart';

/// Base controller class that defines the [count] and [changeCount] method.
abstract class BaseController extends GetxController {
  /// Reactive variable that stores the count.
  final RxInt count = 0.obs;

  /// Method that changes the count.
  void changeCount();
}

/// Controller that increments the count.
class IncrementController extends BaseController {
  @override
  void changeCount() => count.value++;
}

/// Controller that decrements the count.
class DecrementController extends BaseController {
  @override
  void changeCount() => count.value--;
}
