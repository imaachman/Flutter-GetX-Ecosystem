import 'package:get/get.dart';

import 'product.dart';

/// A controller that fetches a list of products from a server.
class Controller extends GetxController {
  /// The list of products fetched from the server.
  List<Product> products = [];

  /// Custom initialization method that populates the products list before
  /// returning the controller instance.
  Future<Controller> init() async {
    products = await fetchProducts() ?? [];
    return this;
  }

  /// Fetches a list of products from the server.
  Future<List<Product>?> fetchProducts() async {
    // Create an instance of [GetConnect] to make HTTP requests.
    final GetConnect connect = GetConnect();

    // Request the server for the list of products.
    final Response response =
        await connect.get('https://fakestoreapi.com/products');

    // Extract the JSON data from the response.
    final List data = response.body;

    // Convert the JSON data to a list of [Product] objects.
    final List<Product> products =
        List.generate(data.length, (index) => Product.fromJson(data[index]));

    return products;
  }
}
