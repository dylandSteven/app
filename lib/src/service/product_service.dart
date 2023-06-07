import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';
import '../model/products_model.dart';

Future<Products> fetchProducts() async {
  final response = await http.get(Uri.parse('http://localhost:3000/products'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Products.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Product>> fetchProduct() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/ce0083c4-714f-4ae4-999c-f0bc2a6de174'));
  if (response.statusCode == 200) {
    final List<dynamic> objectsJson = json.decode(response.body);
    return objectsJson.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch objects');
  }
}
