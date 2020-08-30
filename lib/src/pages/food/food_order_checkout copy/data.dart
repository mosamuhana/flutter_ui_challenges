import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'models.dart';

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
