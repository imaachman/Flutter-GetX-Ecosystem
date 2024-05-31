import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// Home page displays a counter with a button to increment it.
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Initialize [CounterController].
  final counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Wrapped with Obx to listen to state changes.
        child: Obx(
          () => Text(
            // Display [counter] from [CounterController].
            counterController.counter.toString(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Increment counter.
        onPressed: () => counterController.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
