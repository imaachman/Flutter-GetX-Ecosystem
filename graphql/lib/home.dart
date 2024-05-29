import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'product_card.dart';

/// A widget that displays a list of products and allows the user to create new
/// products.
class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL Demo'),
      ),
      // Use [controller.obx] to render UI for the different loading states.
      body: controller.obx(
        (products) {
          return Center(
            child: SizedBox(
              // [context.widthTransformer] is an extension that divides the
              // width of the screen by the given value.
              width: context.widthTransformer(dividedBy: 2),
              // A list of product cards.
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: products!.length,
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
      floatingActionButton: FloatingActionButton(
        // Show a dialog to create a new product.
        onPressed: () => Get.defaultDialog(
          contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          title: 'Create new product',
          content: Column(
            children: [
              // Enter the title, description, and price of the product.
              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Create the product and close the dialog.
              ElevatedButton(
                onPressed: () {
                  controller.createProduct();
                  Get.back();
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
