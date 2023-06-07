import 'dart:ffi';

import 'package:flutter/material.dart';

class Product {
  final int id;
  final String skuCode;
  final String name;
  final String stock;
  final double price;
  final String image;

  const Product(
      {required this.id,
      required this.skuCode,
      required this.name,
      required this.stock,
      required this.price,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        skuCode: json['skuCode'],
        name: json['name'],
        stock: json['stock'],
        price: json['price'],
        image:json['image']);
  }
}
