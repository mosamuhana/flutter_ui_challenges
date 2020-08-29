import 'package:flutter/material.dart';

import 'data.dart';
import 'item_card.dart';

class Cart2Page extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/cart2/page.dart";

  @override
  Widget build(BuildContext context) {
    final items = dummyItemList;
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, int i) {
                var item = items[i];
                return ItemCard(
                  item: item,
                  onDelete: () {
                    print('[$item] Delete');
                  },
                  onChangeCount: (value) {
                    print('[$item] Change Count: $value');
                    item.count = value;
                  },
                );
              },
            ),
          ),
          _checkoutSection,
        ],
      ),
    );
  }

  Widget get _checkoutSection {
    return Material(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _insetsT10L10R10,
            child: Row(
              children: [
                Text("Checkout Price:", style: _w400S14Style),
                _spacer,
                Text("Rs. 5000", style: _w500S16Style),
              ],
            ),
          ),
          _checkoutButton,
        ],
      ),
    );
  }

  Widget get _checkoutButton {
    return Padding(
      padding: _insets10,
      child: Material(
        color: Colors.red,
        elevation: 1,
        child: InkWell(
          onTap: () => print('Checkout'),
          splashColor: Colors.redAccent,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: _insets10,
              child: Text("Checkout", textAlign: TextAlign.center, style: _whiteW700S18Style),
            ),
          ),
        ),
      ),
    );
  }

  final _spacer = Spacer();

  final _w400S14Style = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  final _w500S16Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  final _whiteW700S18Style = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);

  final _insets10 = EdgeInsets.all(10);
  final _insetsT10L10R10 = EdgeInsets.only(top: 10, left: 10, right: 10);
}
