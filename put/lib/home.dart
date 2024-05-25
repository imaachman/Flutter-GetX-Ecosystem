import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// A widget that displays two counters with different colors that can be
/// incremented independently using floating action buttons.
/// Each counter is managed by a different instance of the [Controller] class
/// retrieved using the tag.
class Home extends StatelessWidget {
  Home({super.key});

  // Different instances of the same controller retrieved using the tag.
  final Controller redController = Get.find<Controller>(tag: 'red');
  final Controller blueController = Get.find<Controller>(tag: 'blue');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get.put Demo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CountText(
                // Use the controller with the 'red' tag to access the count.
                count: redController.count.toString(),
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 32),
            Obx(
              () => CountText(
                // Use the controller with the 'blue' tag to access the count.
                count: blueController.count.toString(),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            // Use the controller with the 'red' tag to increment the count.
            onPressed: () => redController.incrementCount(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 24),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            // Use the controller with the 'blue' tag to increment the count.
            onPressed: () => blueController.incrementCount(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
