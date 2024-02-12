import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetxController Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<Controller>(
                  init: Controller(),
                  tag: 'odd',
                  id: 'odd',
                  builder: (controller) => CountText(
                    count: controller.count.toString(),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 32),
                GetBuilder<Controller>(
                  init: Controller(),
                  tag: 'even',
                  id: 'even',
                  builder: (controller) => CountText(
                    count: controller.count.toString(),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<Controller>(
            tag: 'odd',
            builder: (controller) {
              return FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () => controller.incrementCount(),
                child: const Icon(Icons.add),
              );
            },
          ),
          const SizedBox(width: 24),
          GetBuilder<Controller>(
            tag: 'even',
            builder: (controller) {
              return FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () => controller.incrementCount(),
                child: const Icon(Icons.add),
              );
            },
          ),
        ],
      ),
    );
  }
}
