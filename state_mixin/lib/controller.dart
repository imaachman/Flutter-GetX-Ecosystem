import 'package:get/get.dart';

import 'product.dart';

class Controller extends GetxController with StateMixin<List<Product>> {
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<List<Product>?> fetchProducts() async {
    final GetConnect connect = GetConnect();

    try {
      // Loading state
      change(null, status: RxStatus.loading());

      // Request the server for the list of products.
      final Response response =
          await connect.get('https://fakestoreapi.com/products');
      final List data = response.body;

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
}
