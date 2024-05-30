import 'package:get/get.dart';

/// A controller that manages the state of the counters and utilizes the [ever],
/// [once], [debounce], and [interval] workers to increment the counters.
class Controller extends GetxController {
  /// The counter that the workers listen and react to.
  final RxInt count = 0.obs;

  /// The counters that are incremented by the workers.
  final RxInt everCount = 0.obs;
  final RxInt onceCount = 0.obs;
  final RxInt debounceCount = 0.obs;
  final RxInt intervalCount = 0.obs;

  @override
  void onInit() {
    /// Updates [everCount] every time [count] changes.
    ever(count, (value) => everCount.value = value);

    /// Updates [onceCount] only once when [count] changes.
    once(count, (value) => onceCount.value = value);

    /// Updates [debounceCount] after [count] stops changing for 1 second.
    debounce(
      count,
      (value) => debounceCount.value = value,
      time: const Duration(seconds: 1),
    );

    /// Updates [intervalCount] every second as long as [count] is changing.
    interval(
      count,
      (value) => intervalCount.value = value,
      time: const Duration(seconds: 1),
    );

    super.onInit();
  }

  /// Increments the [count] by 1.
  void incrementCount() => count.value++;
}
