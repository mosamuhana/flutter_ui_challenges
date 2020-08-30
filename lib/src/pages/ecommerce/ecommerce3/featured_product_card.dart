import 'package:flutter/material.dart';

import 'models.dart';

class FeaturedProductCard extends StatelessWidget {
  final Product product;

  FeaturedProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: _circularBorder10,
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            margin: _insetsH10,
            width: 150,
            height: 150,
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: _insetsH16V8,
              color: Colors.black87,
              child: Text(product.name, style: _whiteW500S18Style),
            ),
          ),
          _hbox10,
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _whiteW500S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

  final _insetsH10 = EdgeInsets.symmetric(horizontal: 10);
  final _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  final _circularBorder10 = BorderRadius.circular(10);
}
