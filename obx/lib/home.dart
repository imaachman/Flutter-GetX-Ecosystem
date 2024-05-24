import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// Home widget with a counter and a button to increment the counter.
/// Counter value is updated using the Obx widget.
class Home extends StatelessWidget {
  Home({super.key});

  // Inject the controller using [Get.put] to make it available to the Obx
  // widget.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obx Demo'),
      ),
      body: Center(
        // Use the Obx widget to build and update the counter.
        child: Obx(
          () => CountText(
            // Access the latest value of the counter using
            // [controller.count.value].
            count: controller.count.value.toString(),
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Increment the counter when the button is pressed.
        onPressed: () => controller.incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
