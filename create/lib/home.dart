import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'shopping_item.dart';

/// Widget that displays the shopping items and the total number of items in the
/// shopping cart.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get.create Demo'),
      ),
      body: Stack(
        children: [
          // Uses shared controller state.
          Positioned(
            bottom: 24,
            right: 24,
            child: Obx(
              () => Text(
                // Retrieves the total from the shared controller instance.
                'Total: ${Get.find<Controller>(tag: 'total').total.value}',
                style: Get.theme.textTheme.titleLarge,
              ),
            ),
          ),

          Center(
            child: SizedBox(
              width: 200,
              child: ListView.builder(
                itemCount: 25,
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
