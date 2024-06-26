import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product.dart';

/// A card displaying the title, description, and price of a [Product].
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          title: Text(
            product.title,
            style: Get.theme.textTheme.labelLarge,
            maxLines: 1,
          ),
          subtitle: Text(
            product.description,
            style: Get.theme.textTheme.labelSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            '\$${product.price}',
            style: Get.theme.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
