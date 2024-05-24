import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_mixin/product_card.dart';

import 'controller.dart';

/// A widget that displays a list of products.
class Home extends StatelessWidget {
  Home({super.key});

  // Inject the controller into the widget.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateMixin Demo'),
      ),
      // Use the [obx] method to listen to the controller's state and build
      // the loading, error, empty, or data widget accordingly.
      body: controller.obx(
        (products) {
          return Center(
            child: SizedBox(
              // [context.widthTransformer] is a custom extension method that
              // divides the screen width by 2.
              width: context.widthTransformer(dividedBy: 2),
              child: ListView.separated(
                shrinkWrap: true,
                // [products] is a list of products.
                itemCount: products!.length,
                // Build a [ProductCard] for each product in the list.
                itemBuilder: (context, index) =>
                    ProductCard(product: products[index]),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          );
        },
        // Show a loading indicator while the data is being fetched.
        onLoading: const Center(child: CircularProgressIndicator()),
        // Show an error message if the data fetching fails.
        onError: (error) => Text(error.toString()),
        // Show a message if the data is empty.
        onEmpty: const Center(
          child: Text('No data found'),
        ),
      ),
    );
  }
}
