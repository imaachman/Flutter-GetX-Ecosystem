import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// A widget that displays a counter and a button to increment the counter.
/// It extends [GetView] to use the controller directly, without using
/// [Get.find]. We can access the controller using [controller] property.
class Home extends GetView<Controller> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetView Demo'),
      ),
      body: Center(
        child: Obx(
          () => CountText(
            // Use controller directly to display the count.
            count: controller.count.value.toString(),
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Increment the count when the button is pressed.
        onPressed: () => controller.incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
