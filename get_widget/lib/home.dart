import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'shopping_item.dart';

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
                'Total: ${Get.find<Controller>(tag: 'total').total.value}',
                style: Get.theme.textTheme.titleLarge,
              ),
            ),
          ),

          Center(
            child: SizedBox(
              width: 200,
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
