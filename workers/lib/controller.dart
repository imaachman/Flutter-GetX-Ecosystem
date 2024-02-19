import 'package:get/get.dart';

class Controller extends GetxController {
  final RxInt count = 0.obs;

  final RxInt everCount = 0.obs;
  final RxInt onceCount = 0.obs;
  final RxInt debounceCount = 0.obs;
  final RxInt intervalCount = 0.obs;

  @override
  void onInit() {
    // Update the everCount every time the count changes.
    ever(count, (value) => everCount.value = value);

    // Update the onceCount only once when the count changes.
    once(count, (value) => onceCount.value = value);

    // Update the debounceCount after the count stops changing for 1 second.
    debounce(
      count,
      (value) => debounceCount.value = value,
      time: const Duration(seconds: 1),
    );

    // Update the intervalCount every second.
    interval(
      count,
      (value) => intervalCount.value = value,
      time: const Duration(seconds: 1),
    );

    super.onInit();
  }

  void incrementCount() => count.value++;
}
