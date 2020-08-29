import 'package:flutter/material.dart';

import 'cart_item.dart';
import 'data.dart';

class Cart1Page extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/cart1/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CART", style: _pageTitleStyle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                padding: _insets16,
                itemCount: dummyItemList.length,
                itemBuilder: (_, i) => CartItem(item: dummyItemList[i]),
              ),
            ),
            Container(
              width: double.infinity,
              padding: _insets20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _subtotalRow('Subtotal', '\$50', _greyS16Style),
                  _hbox5,
                  _subtotalRow('Delivery', '\$05', _greyS16Style),
                  _hbox10,
                  _subtotalRow('Cart Subtotal', '\$55', _boldS18Style),
                  _hbox20,
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      height: 50,
                      color: Colors.pinkAccent,
                      child: Text('SECURE CHECKOUT', style: _whiteStyle),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subtotalRow(String name, String value, TextStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(name, style: style),
        _wbox10,
        Text(value, style: style),
      ],
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox10 = SizedBox(width: 10);

  final _pageTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade700);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _greyS16Style = TextStyle(color: Colors.grey.shade700, fontSize: 16);
  final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  final _insets16 = EdgeInsets.all(16);
  final _insets20 = EdgeInsets.all(20);
}
