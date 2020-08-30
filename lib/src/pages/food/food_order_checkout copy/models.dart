import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final Color bgColor;

  Product({
    this.id,
    this.name,
    this.price,
    this.image,
    this.bgColor,
  });
}

class OrderItem {
  final String title;
  final double price;
  final String image;
  final Color bgColor;
  int quantity;
  OrderItem({
    this.title,
    this.price,
    this.image,
    this.bgColor,
    this.quantity,
  });
}
