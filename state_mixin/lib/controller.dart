import 'package:get/get.dart';

import 'product.dart';

/// A controller that fetches a list of products from the server.
class Controller extends GetxController with StateMixin<List<Product>> {
  @override
  void onInit() {
    // Fetch the list of products when the controller is initialized.
    fetchProducts();

    super.onInit();
  }

  /// Fetches a list of products from the server.
  Future<List<Product>?> fetchProducts() async {
    // Create a new instance of GetConnect.
    final GetConnect connect = GetConnect();

    try {
      // Change the state to loading.
      change(null, status: RxStatus.loading());

      // Request the server for the list of products.
      final Response response =
          await connect.get('https://fakestoreapi.com/products');

      // Get the JSON data from the response.
      final List data = response.body;

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
      // Change the state to error.
      change(null, status: RxStatus.error(error.toString()));

      return null;
    }
  }
}
