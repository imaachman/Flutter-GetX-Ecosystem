import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// Home widget that displays two count values with different colors. One for odd
/// and another for even. The count value can be incremented by pressing the
/// floating action button or by entering the value in the text field.
class Home extends StatelessWidget {
  Home({super.key});

  // Inject the controller with [Get.put] method.
  final Controller controller = Get.put(Controller());

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
                // Updates only when the count is odd.
                GetBuilder<Controller>(
                  id: 'odd',
                  builder: (controller) => CountText(
                    count: controller.count.toString(),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 32),
                // Updates only when the count is even.
                GetBuilder<Controller>(
                  id: 'even',
                  builder: (controller) => CountText(
                    count: controller.count.toString(),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 100,
            child: SizedBox(
              width: 200,
              child: TextField(
                // Use the textEditingController from the controller.
                controller: controller.textEditingController,
                decoration:
                    const InputDecoration(hintText: 'Enter count value'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]*')),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // Increment the count value when the button is pressed.
        onPressed: () => controller.incrementCount(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
