import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'models.dart';

List<Product> getProducts() {
  return [
    Product(
      id: 1,
      name: "Manana Burger",
      price: 12,
      color: Colors.deepOrange,
      image: '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
    ),
    Product(
      id: 2,
      name: "Burger",
      price: 15,
      color: Colors.deepOrange,
      image: '$STORE_BASE_URL/food%2Fburger1.jpg?alt=media',
    ),
    Product(
      id: 3,
      name: "French Fries",
      price: 8,
      color: Colors.deepOrange,
      image: '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media',
    ),
  ];
}

Product getProduct(int id) {
  return getProducts().firstWhere((x) => x.id == id, orElse: () => null);
}

Order getOrder() {
  return Order(
    id: 1001,
    vat: 10,
    items: [
      OrderItem(productId: 1, quantity: 2),
      OrderItem(productId: 2, quantity: 1),
      OrderItem(productId: 3, quantity: 1),
    ],
  );
}

/*
List<OrderItem> getOrderItems() {
  return [
    OrderItem(
      title: "Manana Burger",
      quantity: 2,
      price: 12,
      bgColor: Colors.deepOrange,
      image: '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
    ),
    OrderItem(
      title: "Burger",
      quantity: 1,
      price: 15,
      bgColor: Colors.deepOrange,
      image: '$STORE_BASE_URL/food%2Fburger1.jpg?alt=media',
    ),
    OrderItem(
      title: "French Fries",
      quantity: 1,
      price: 8,
      bgColor: Colors.deepOrange,
      image: '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media',
    ),
  ];
}

*/
