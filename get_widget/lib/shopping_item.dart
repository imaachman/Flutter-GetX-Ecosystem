import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// Widget that displays a shopping item with increment and decrement buttons.
///
/// It uses two instances of the [Controller] class to manage the state of the
/// shopping cart, one for the local state and one for the shared state.
///
/// The local state is used to display the quantity of this item, while the
/// shared state is used to display the total number of items in the shopping
/// cart.
///
/// The local state can be accessed directly using [controller] property of the
/// [GetWidget] class while the shared state needs to be accessed using the
/// [Get.find] method with the tag 'total'.
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
