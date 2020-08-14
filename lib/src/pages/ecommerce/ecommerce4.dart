import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class EcommerceFourPage extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce4.dart";

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context).textTheme.headline6;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text('Buy Stuff')),
      body: ListView(
        children: [
          _titleText('Categories', headline6),
          _categoryList,
          _titleText('Featured Products', headline6),
          _featuredProducts,
          _recentProductsHeader(headline6),
          ..._recentProducts,
          _hbox10,
        ],
      ),
    );
  }

  Widget get _categoryList {
    return Container(
      width: double.infinity,
      height: 150,
      margin: _insetsT15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (_, i) => _CategoryCard(category: _categories[i]),
      ),
    );
  }

  Widget get _featuredProducts {
    return Container(
      width: double.infinity,
      height: 150,
      margin: _insetsT15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _products.length,
        itemBuilder: (_, i) => _FeaturedProduct(product: _products[i]),
      ),
    );
  }

  List<Widget> get _recentProducts {
    //return [1, 2, 3, 4, 5].map((product) => _ProductListItem(onPressed: () {})).toList();
    return _products.map((product) => _ProductListItem(product: product, onPressed: () {})).toList();
  }

  Widget _recentProductsHeader(TextStyle style) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade300,
      height: 60,
      child: Padding(
        padding: _insetsH10V10,
        child: Row(
          children: [
            Text("Recent products", style: style),
            _spacer,
            InkWell(
              onTap: () => print("View all"),
              child: Text("View all"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleText(String text, TextStyle style) {
    return Padding(
      padding: _insetsT15L10R10,
      child: Text(text, style: style),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _CategoryCard extends StatelessWidget {
  final _Category category;

  const _CategoryCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: _circularBorder10,
              color: Colors.black12,
              image: DecorationImage(image: NetworkImage(category.image), fit: BoxFit.cover),
            ),
            alignment: Alignment.center,
            margin: _insetsH10,
            width: 100,
            height: 100,
          ),
          _hbox10,
          Text(category.name)
        ],
      ),
    );
  }
}

class _ProductListItem extends StatelessWidget {
  final _Product product;
  final Function onPressed;

  const _ProductListItem({
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
                          Text("Rs. ${product.price}", style: _priceStyle),
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
}

class _FeaturedProduct extends StatelessWidget {
  final _Product product;

  const _FeaturedProduct({Key key, this.product}) : super(key: key);

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
              child: Text(product.name, style: _productNameStyle),
            ),
          ),
          _hbox10,
        ],
      ),
    );
  }
}
// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _categories = <_Category>[
  _Category(id: 1, name: 'Category 1', image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
  _Category(id: 2, name: 'Category 2', image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
  _Category(id: 3, name: 'Category 3', image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  _Category(id: 4, name: 'Category 4', image: '$STORE_BASE_URL/img%2F4.jpg?alt=media'),
  _Category(id: 5, name: 'Category 5', image: '$STORE_BASE_URL/img%2F5.jpg?alt=media'),
  _Category(id: 6, name: 'Category 6', image: '$STORE_BASE_URL/img%2F6.jpg?alt=media'),
  _Category(id: 7, name: 'Category 7', image: '$STORE_BASE_URL/img%2F7.jpg?alt=media'),
];

final _products = <_Product>[
  _Product(id: 1, name: 'Product 1', price: 4000, image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
  _Product(id: 2, name: 'Product 2', price: 3000, image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
  _Product(id: 3, name: 'Product 3', price: 6000, image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  _Product(id: 4, name: 'Product 4', price: 6500, image: '$STORE_BASE_URL/img%2F4.jpg?alt=media'),
  _Product(id: 5, name: 'Product 5', price: 4800, image: '$STORE_BASE_URL/img%2F5.jpg?alt=media'),
];

class _Category {
  final int id;
  final String name;
  final String image;
  _Category({this.id, this.name, this.image});
}

class _Product {
  final int id;
  final String name;
  final double price;
  final String image;
  _Product({this.id, this.name, this.price, this.image});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox5 = SizedBox(height: 5);
const _hbox10 = SizedBox(height: 10);

const _priceStyle = TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold);
const _productNameStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

const _insetsT15L10R10 = EdgeInsets.only(top: 15, left: 10, right: 10);
const _insetsT15 = EdgeInsets.only(top: 15);
const _insetsH10V10 = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const _insetsH10 = EdgeInsets.symmetric(horizontal: 10);
const _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const _insetsH8V4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
const _insets0 = EdgeInsets.all(0);
const _insets8 = EdgeInsets.all(8);

const _spacer = Spacer();

final _circularBorder10 = BorderRadius.circular(10);
final _productListItemShape = RoundedRectangleBorder(borderRadius: _circularBorder10);
