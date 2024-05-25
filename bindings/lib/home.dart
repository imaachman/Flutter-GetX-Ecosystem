import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// Widget that displays the count and a button to increment it.
/// It can access the controller directly because the controller is already
/// initialized via the [HomeBinding] class.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bindings Demo'),
      ),
      body: Center(
        child: Obx(
          () => CountText(
            // Use the controller directly because it's already initialized
            // via bindings.
            count: Get.find<Controller>().count.value.toString(),
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Use the controller directly because it's already initialized
        // via bindings.
        onPressed: () => Get.find<Controller>().incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
