import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ShoppingItem extends GetWidget<Controller> {
  ShoppingItem({super.key});

  // Uses tag 'total', means it is injected by [Get.put].
  final Controller sharedController = Get.find(tag: 'total');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            // Decrement quantity of local controller state.
            controller.quantity.value--;

            // Decrement total quantity of shared controller state.
            sharedController.total.value--;
          },
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(width: 24),
        SizedBox(
          width: 50,
          child: Center(
            child: Obx(
              () => Text(
                // Displays quantity of local controller state.
                controller.quantity.value.toString(),
                style: Get.theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        IconButton(
          onPressed: () {
            // Increment quantity of local controller state.
            controller.quantity.value++;

            // Increment total quantity of shared controller state.
            sharedController.total.value++;
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
