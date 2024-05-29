import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product.dart';

/// A controller that fetches the list of products using GraphQL and allows for
/// mutation to create a new product. It extends [GetxController] for state
/// management and mixes with [StateMixin] to handle different loading states.
class Controller extends GetxController with StateMixin<List<Product>> {
  /// Text editing controller to access the title of the product.
  final TextEditingController titleController = TextEditingController();

  /// Text editing controller to access the description of the product.
  final TextEditingController descriptionController = TextEditingController();

  /// Text editing controller to access the price of the product.
  final TextEditingController priceController = TextEditingController();

  @override
  void onInit() {
    // Fetch the list of products when the controller is initialized.
    fetchProducts();
    super.onInit();
  }

  @override
  onClose() {
    // Dispose the text editing controllers when the controller is closed.
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.onClose();
  }

  /// Fetch the list of products using GraphQL.
  Future<List<Product>?> fetchProducts() async {
    // Instance of [GetConnect] to make GraphQL queries.
    final GetConnect connect = GetConnect();

    try {
      // Change the state to loading.
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

      // Extract the list of products from the response.
      final List data = response.body['products'];

      // If the response is empty, change the state to empty and return null.
      if (data.isEmpty) {
        // Empty state.
        change(null, status: RxStatus.empty());
        return null;
      } else {
        // Convert the JSON data to a list of Product objects.
        final List<Product> products = List.generate(
            data.length, (index) => Product.fromJson(data[index]));

        // Change the state to success.
        change(products, status: RxStatus.success());

        return products;
      }
    } catch (error) {
      // Change the state to error and return null.
      change(null, status: RxStatus.error(error.toString()));
      return null;
    }
  }

  /// Create a new product and fetch the updated list of products using GraphQL.
  Future<void> createProduct() async {
    // Instance of [GetConnect] to make GraphQL mutations.
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
      // Show a snackbar with the error message.
      Get.snackbar('Error', error.toString());
    }
  }
}
