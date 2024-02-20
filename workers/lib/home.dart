import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

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
                  CountCard(
                    label: 'Ever',
                    count: controller.everCount.value.toString(),
                    color: Colors.redAccent,
                  ),
                  const SizedBox(width: 40),
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
                  CountCard(
                    label: 'Debounce',
                    count: controller.debounceCount.value.toString(),
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 40),
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
        // Count is incremented for each worker differently.
        // Tap the button continuously and rapidly to see the difference.
        onPressed: () => controller.incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
