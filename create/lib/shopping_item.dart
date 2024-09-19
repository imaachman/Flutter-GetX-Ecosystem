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
class ShoppingItem extends StatelessWidget {
  ShoppingItem({super.key});

  // Without tag, means it is injected by [Get.create].
  final Controller localController = Get.find();

  // Uses tag 'total', means it is injected by [Get.put].
  final Controller sharedController = Get.find(tag: 'total');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            // Do not allow negative values.
            if (localController.quantity.value == 0) return;

            // Decrement quantity of local controller state.
            localController.quantity.value--;

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
                localController.quantity.value.toString(),
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
            localController.quantity.value++;

            // Increment total quantity of shared controller state.
            sharedController.total.value++;
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
