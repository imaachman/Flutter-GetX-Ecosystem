import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'product_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get.putAsync Demo'),
      ),
      body: Center(
        child: SizedBox(
          width: context.widthTransformer(dividedBy: 2),
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
