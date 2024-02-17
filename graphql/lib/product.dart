class Product {
  late String id;
  late String title;
  late num price;
  late String description;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
