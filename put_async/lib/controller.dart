import 'package:get/get.dart';

import 'product.dart';

class Controller extends GetxController {
  List<Product> products = [];

  // Custom initialization method that populates the products list before
  // returning the controller instance.
  Future<Controller> init() async {
    products = await fetchProducts() ?? [];
    return this;
  }

  Future<List<Product>?> fetchProducts() async {
    final GetConnect connect = GetConnect();

    // Request the server for the list of products.
    final Response response =
        await connect.get('https://fakestoreapi.com/products');
    final List data = response.body;

    // Convert the JSON data to a list of Product objects.
    final List<Product> products =
        List.generate(data.length, (index) => Product.fromJson(data[index]));

    return products;
  }
}
