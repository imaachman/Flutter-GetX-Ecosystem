import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'shopping_item.dart';

/// Widget with a list of shopping items, each with buttons to add or remove
/// the item from the cart. The total number of items in the cart is displayed
/// at the bottom right corner of the screen.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetWidget Demo'),
      ),
      body: Stack(
        children: [
          // Uses shared controller state.
          Positioned(
            bottom: 24,
            right: 24,
            child: Obx(
              () => Text(
                // Display the total number of items in the cart.
                // Access the shared controller state using the 'total' tag.
                'Total: ${Get.find<Controller>(tag: 'total').total.value}',
                style: Get.theme.textTheme.titleLarge,
              ),
            ),
          ),

          Center(
            child: SizedBox(
              width: 200,
              // Display a list of shopping items.
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ShoppingItem();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
