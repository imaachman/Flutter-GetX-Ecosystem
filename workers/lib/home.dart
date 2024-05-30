import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_card.dart';

/// Displays four counters that are incremented by different workers -- [ever],
/// [once], [debounce], and [interval]. Each worker increments its counter
/// differently and the difference can be observed by tapping the floating
/// action button continuously and rapidly.
class Home extends StatelessWidget {
  Home({super.key});

  // Initialize the controller to manage the state of the counters.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workers Demo'),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Display [ever] worker's counter.
                  CountCard(
                    label: 'Ever',
                    count: controller.everCount.value.toString(),
                    color: Colors.redAccent,
                  ),
                  const SizedBox(width: 40),
                  // Display [once] worker's counter.
                  CountCard(
                    label: 'Once',
                    count: controller.onceCount.value.toString(),
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Display [debounce] worker's counter.
                  CountCard(
                    label: 'Debounce',
                    count: controller.debounceCount.value.toString(),
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 40),
                  // Display [interval] worker's counter.
                  CountCard(
                    label: 'Interval',
                    count: controller.intervalCount.value.toString(),
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Increment count for all workers.
        // Count is incremented for each worker differently.
        // Tap the button continuously and rapidly to see the difference.
        onPressed: () => controller.incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
