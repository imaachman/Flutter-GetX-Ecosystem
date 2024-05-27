import 'package:get/get.dart';

/// Controller class to manage the state of the shopping cart.
class Controller extends GetxController {
  /// The quantity of a single item in the shopping cart.
  final RxInt quantity = 0.obs;

  /// The total number of items in the shopping cart.
  final RxInt total = 0.obs;
}
