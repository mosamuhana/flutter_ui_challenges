import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final Color color;

  Product({
    this.id,
    this.name,
    this.price,
    this.image,
    this.color,
  });
}

class Order {
  final int id;
  final List<OrderItem> items;
  final double vat;

  Order({
    this.id,
    this.items,
    this.vat,
  });

  Order copyWith({List<OrderItem> items, double vat}) {
    return Order(
      id: id,
      vat: vat ?? this.vat,
      items: items ?? this.items ?? [],
    );
  }

  Order add(int productId) {
    var newItems = <OrderItem>[];
    var item = this.items.firstWhere((x) => x.productId == productId, orElse: () => null);

    if (item == null) {
      newItems = [...items, OrderItem(productId: productId, quantity: 1)];
    } else {
      newItems = items.map((i) => i.copyWith(quantity: i.quantity + 1)).toList();
    }

    return Order(
      id: id,
      vat: vat ?? this.vat,
      items: newItems,
    );
  }
}

class OrderItem {
  final int productId;
  int quantity;

  OrderItem({
    this.productId,
    this.quantity,
  });

  OrderItem copyWith({int productId, int quantity}) {
    return OrderItem(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
