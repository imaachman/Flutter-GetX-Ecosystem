import 'package:get/get.dart';

// Controller class that manages the count value and updates the widgets.
class Controller extends GetxController {
  // Count value that will be displayed in the widgets.
  int count = 0;

  // Method to increment the count value by 1.
  void incrementCount() {
    count += 1;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    // Update the listener widgets.
    update(ids);
  }
}
