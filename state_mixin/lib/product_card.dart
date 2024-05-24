import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_mixin/product.dart';

/// A widget that displays the product image, title, description, and price.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // [context.heightTransformer] is a custom extension method that divides
      // the screen height by 4.
      height: context.heightTransformer(dividedBy: 4),
      child: Card(
        child: Column(
          children: [
            Expanded(flex: 3, child: Image.network(product.image)),
            Expanded(
              flex: 1,
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
          ],
        ),
      ),
    );
  }
}
