import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

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
                count: redController.count.toString(),
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 32),
            Obx(
              () => CountText(
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
            onPressed: () => redController.incrementCount(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 24),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () => blueController.incrementCount(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
