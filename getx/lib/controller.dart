import 'package:get/get.dart';

// Controller class with a reactive count variable and a method to increment it.
class Controller extends GetxController {
  // Reactive variable to store the count.
  final RxInt count = 0.obs;

  // Method to increment the count.
  void incrementCount() => count.value++;
}
