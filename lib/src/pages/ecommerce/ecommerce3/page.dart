import 'package:flutter/material.dart';

import 'data.dart';
import 'category_card.dart';
import 'product_card.dart';
import 'featured_product_card.dart';

class Ecommerce3Page extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce3/page.dart";

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.headline6;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text('Buy Stuff')),
      body: ListView(
        children: [
          Padding(
            padding: _insetsL10T15R10,
            child: Text('Categories', style: headline6),
          ),
          Container(
            width: double.infinity,
            height: 150,
            margin: _insetsT15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_, i) => CategoryCard(category: categories[i]),
            ),
          ),
          Padding(
            padding: _insetsL10T15R10,
            child: Text('Featured Products', style: headline6),
          ),
          Container(
            width: double.infinity,
            height: 150,
            margin: _insetsT15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (_, i) => FeaturedProductCard(product: products[i]),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            height: 60,
            child: Padding(
              padding: _insetsH10V10,
              child: Row(
                children: [
                  Text("Recent products", style: headline6),
                  _spacer,
                  InkWell(
                    onTap: () => print("View all"),
                    child: Text("View all"),
                  ),
                ],
              ),
            ),
          ),
          for (var product in products)
            ProductCard(
              product: product,
              onPressed: () {},
            ),
          _hbox20,
        ],
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);

  final _insetsL10T15R10 = EdgeInsets.only(top: 15, left: 10, right: 10);
  final _insetsT15 = EdgeInsets.only(top: 15);
  final _insetsH10V10 = EdgeInsets.symmetric(horizontal: 10, vertical: 10);

  final _spacer = Spacer();
}
