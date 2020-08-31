import 'package:flutter/material.dart';

class GroceryItem {
  final int id;
  final String title;
  final String description;
  final String package;
  final String image;
  final double price;
  final String category;
  GroceryItem({
    this.id,
    this.title,
    this.description,
    this.package,
    this.image,
    this.price,
    this.category,
  });
}

class Category {
  final int id;
  final String title;
  final String image;
  final Color color;
  Category({
    this.id,
    this.title,
    this.image,
    this.color,
  });
}

class CartItem {
  final GroceryItem item;
  int _quantity;

  CartItem({
    this.item,
    int quantity = 1,
  }) {
    this.quantity = quantity;
  }

  int get quantity => _quantity;
  set quantity(int value) {
    _quantity = value == null || value <= 0 ? 1 : value;
  }
}
