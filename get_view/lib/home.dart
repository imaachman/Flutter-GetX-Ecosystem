import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

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
            count: controller.count.value.toString(),
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
