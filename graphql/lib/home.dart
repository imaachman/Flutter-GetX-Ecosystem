import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'product_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL Demo'),
      ),
      body: controller.obx(
        (products) {
          return Center(
            child: SizedBox(
              width: context.widthTransformer(dividedBy: 2),
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
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Text(error.toString()),
        onEmpty: const Center(
          child: Text('No data found'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.defaultDialog(
          contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          title: 'Create new product',
          content: Column(
            children: [
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
