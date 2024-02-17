import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product.dart';

class Controller extends GetxController with StateMixin<List<Product>> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  @override
  onClose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.onClose();
  }

  /// Fetch the list of products using GraphQL.
  Future<List<Product>?> fetchProducts() async {
    final GetConnect connect = GetConnect();

    try {
      // Loading state
      change(null, status: RxStatus.loading());

      // GraphQL query to get the list of products.
      const String query = r'''
        query {
          products {
            id
            title
            price
            description
          }
        }
        ''';

      // Request the server for the list of products.
      final GraphQLResponse response = await connect.query(
        query,
        url: 'https://api.escuelajs.co/graphql',
      );

      final List data = response.body['products'];

      // If the response is empty, change the state to empty and return null.
      if (data.isEmpty) {
        // Empty state
        change(null, status: RxStatus.empty());
        return null;
      } else {
        // Convert the JSON data to a list of Product objects.
        final List<Product> products = List.generate(
            data.length, (index) => Product.fromJson(data[index]));

        // Success state
        change(products, status: RxStatus.success());

        return products;
      }
    } catch (error) {
      // Error state
      change(null, status: RxStatus.error(error.toString()));

      return null;
    }
  }

  /// Create a new product and fetch the updated list of products using GraphQL.
  Future<void> createProduct() async {
    final GetConnect connect = GetConnect();

    try {
      // GraphQL mutation to add a new product.
      final String mutation = '''
        mutation {
          addProduct(
            data: {
              title: "${titleController.text}"
              price: ${num.parse(priceController.text)}
              description: "${descriptionController.text}"
              categoryId: 1
              images: ["https://placeimg.com/640/480/any"]
            }
          ) {
            title
            price
            images
            category {
              id
              name
              image
            }
          }
        }
        ''';

      // Request the server to add a new product.
      await connect.query(mutation, url: 'https://api.escuelajs.co/graphql');

      // Fetch the updated list of products.
      fetchProducts();
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }
}
