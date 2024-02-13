import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_mixin/product_card.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateMixin Demo'),
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
    );
  }
}
