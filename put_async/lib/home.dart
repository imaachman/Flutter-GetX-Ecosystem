import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'product_card.dart';

/// The home screen that displays a list of products.
class Home extends StatelessWidget {
  Home({super.key});

  // Retrieve the controller instance injected by [Get.putAsync].
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get.putAsync Demo'),
      ),
      body: Center(
        child: SizedBox(
          // [context.widthTransformer] is a custom extension method that
          // divides the width of the screen by the given value.
          width: context.widthTransformer(dividedBy: 2),
          // Get the list of products from the controller and display them in a
          // ListView.
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.products.length,
            itemBuilder: (context, index) =>
                ProductCard(product: controller.products[index]),
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ),
    );
  }
}
