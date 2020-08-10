import 'package:flutter/material.dart';

import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';
import 'data/products.dart';

class HeroAnimationDetailsPage extends StatelessWidget {
  static final String path = "lib/src/pages/animations/hero_animation_details.page.dart";
  final Product product;

  const HeroAnimationDetailsPage({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "image_${product.id}",
            child: PNetworkImage(product.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                hSizedBox10,
                BackIconButton(color: Colors.white),
                Spacer(),
                hSizedBox10,
                Hero(
                  tag: "title_${product.id}",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      product.name,
                      style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                hSizedBox20,
                Hero(
                  tag: "price_${product.id}",
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      '\$${product.price}',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                hSizedBox20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
