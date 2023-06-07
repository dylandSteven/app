import './product_model.dart';

class Products {
  final List<Product> products;

  const Products({
    required this.products,
  });
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(products: json["products"]);
  }
}
