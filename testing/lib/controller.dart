import 'package:get/get.dart';

/// Controller class that provides methods to increment and decrement the
/// counter. It also initializes the counter value to 1 on controller
/// initialization and sets the counter value to -1 on controller disposal.
class CounterController extends GetxController {
  // Create a counter variable.
  final counter = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Set counter value to 1 on controller initialization.
    counter.value = 1;
  }

  @override
  void onClose() {
    // Set counter value to -1 on controller disposal.
    counter.value = -1;
    super.onClose();
  }

  // Increment counter value.
  void increment() => counter.value++;

  // Decrement counter value.
  void decrement() => counter.value--;
}
