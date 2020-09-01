import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: _productCardDecoration,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(product.image, height: 80),
            _hbox5,
            Text(product.title, style: _bold18Style),
            Container(
              padding: _insets5,
              margin: _insetsT4,
              color: Colors.deepOrange,
              child: Text("\$ ${product.price}", style: _whiteBoldS12Style),
            ),
          ],
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _bold18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final _whiteBoldS12Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);

  final _insets5 = EdgeInsets.all(5);
  final _insetsT4 = EdgeInsets.only(top: 4);

  final _productCardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 6),
    ],
    color: Colors.white,
  );
}
