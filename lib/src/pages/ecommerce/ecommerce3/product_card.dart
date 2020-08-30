import 'package:flutter/material.dart';

import 'models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onPressed;

  ProductCard({
    Key key,
    @required this.onPressed,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insetsH8V4,
      child: MaterialButton(
        padding: _insets0,
        elevation: 0.5,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: _productListItemShape,
        onPressed: onPressed,
        child: Row(
          children: [
            Ink(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: _insets8,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(product.name),
                          _hbox5,
                          Text("Rs. ${product.price}", style: _blueBoldS20Style),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () => print('Add to cart (productId: ${product.id})'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _blueBoldS20Style = TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold);

  final _insetsH8V4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  final _insets0 = EdgeInsets.all(0);
  final _insets8 = EdgeInsets.all(8);

  final _productListItemShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
}
