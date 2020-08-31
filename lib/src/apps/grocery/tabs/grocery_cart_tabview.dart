import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../widgets/grocery_cart_item.dart';
import '../models.dart';
import '../data.dart';

class GroceryCartTabView extends StatefulWidget {
  @override
  _GroceryCartTabViewState createState() => _GroceryCartTabViewState();
}

class _GroceryCartTabViewState extends State<GroceryCartTabView> {
  List<CartItem> items = getCartItems();

  double subtotal = 1500;
  double deliveryFee = 100;
  double get total => subtotal + deliveryFee;

  @override
  void initState() {
    items = getCartItems();
    _calc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: _insets10,
            children: List.generate(items.length, (i) {
              var item = items[i];
              return GroceryCartItem(
                item: item,
                onChange: (value) => _updateQuantity(item, value),
              );
            }),
          ),
        ),
        _hbox10,
        ClipPath(
          clipper: OvalTopBorderClipper(),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.grey.shade700, spreadRadius: 80),
              ],
              color: Colors.white,
            ),
            padding: _insetsL20T40R20B10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text("Rs. ${subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                _hbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery fee"),
                    Text("Rs. ${deliveryFee.toStringAsFixed(2)}"),
                  ],
                ),
                _hbox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total"),
                    Text("Rs. ${total.toStringAsFixed(2)}"),
                  ],
                ),
                _hbox10,
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Continue to Checkout", style: _whiteStyle),
                      Text("Rs. ${total.toStringAsFixed(2)}", style: _whiteStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _updateQuantity(CartItem cartItem, int quantity) {
    items = items.map((x) {
      return CartItem(
        item: x.item,
        quantity: x.item.id == cartItem.item.id ? quantity : x.quantity,
      );
    }).toList();
    _calc();
    setState(() {});
  }

  void _calc() {
    var t = 0.0;
    var f = 0.0;
    for (var item in items) {
      var q = item.quantity;
      var p = item.item.price;
      f += q * (p * 0.1);
      t += q * p;
    }
    subtotal = t;
    deliveryFee = f;
  }

  final _hbox10 = SizedBox(height: 10);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _insetsL20T40R20B10 = EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 10);
  final _insets10 = EdgeInsets.all(10);
}
