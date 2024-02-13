import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final RxInt count = 0.obs;

  void changeCount();
}

class IncrementController extends BaseController {
  @override
  void changeCount() => count.value++;
}

class DecrementController extends BaseController {
  @override
  void changeCount() => count.value--;
}
