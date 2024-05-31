import 'package:get/get.dart';

/// Controller class that manages the name and age states.
class Controller extends GetxController {
  /// Age stored as simple variable.
  int age = 0;

  /// Name stored as reactive variable.
  final RxString name = ''.obs;

  /// Method to increment age and notify the listeners manually.
  void incrementAge() {
    // Increment age value
    age += 1;

    // Update the listener widgets.
    update();
  }

  /// Method to decrement age and notify the listeners manually.
  void decrementAge() {
    // Increment age value.
    age -= 1;

    // Age should not be negative.
    if (age < 0) age = 0;

    // Update the listener widgets.
    update();
  }

  /// Method to set the name value. Listeners will be notified automatically.
  void setName(String value) => name.value = value;
}
