import 'package:get/get.dart';

class Controller extends GetxController {
  int count = 0;

  void incrementCount() {
    count += 1;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    update(ids);
  }

  void setCount(int value) {
    count = value;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    update(ids);
  }
}
