import 'package:flutter/material.dart';

import '../widgets/grocery_cart_item.dart';
import '../data.dart';

class GroceryWishlistTabView extends StatelessWidget {
  final items = getWishCartItems();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: _insets10,
            children: List.generate(items.length, (i) => GroceryCartItem(item: items[i])),
          ),
        ),
        _hbox10,
        Container(
          padding: _insetsH20,
          child: RaisedButton(
            color: Colors.green,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Add to Wishlist", style: _whiteStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _insets10 = EdgeInsets.all(10);
  final _insetsH20 = EdgeInsets.only(left: 20, right: 20);
  final _whiteStyle = TextStyle(color: Colors.white);
}
