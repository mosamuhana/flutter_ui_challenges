import 'package:flutter/material.dart';

import 'product_card.dart';
import 'product.dart';
import 'data.dart';

class FoodsPage extends StatefulWidget {
  @override
  _FoodsPageState createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  final _searchController = TextEditingController(text: '');
  List<Product> products;

  @override
  void initState() {
    products = getAllProducts();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backContainer1,
        _backContainer2,
        CustomScrollView(
          slivers: [
            _pageHeader,
            _productList,
          ],
        ),
      ],
    );
  }

  Widget get _pageHeader {
    return SliverToBoxAdapter(
      child: Padding(
        padding: _insetsH20V10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _insetsL20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Good Morning", style: _whiteBoldS32Style),
                  Text("Everyone", style: _whiteBoldS32Style),
                ],
              ),
            ),
            _hbox20,
            Material(
              elevation: 5,
              borderRadius: _circularBorder30,
              child: TextField(
                controller: _searchController,
                cursorColor: Theme.of(context).primaryColor,
                style: _blackS18Style,
                decoration: _searchDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _productList {
    return SliverPadding(
      padding: _insets26,
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          ProductCard(product: products[0]),
          ProductCard(product: products[1]),
          ProductCard(product: products[2]),
          ProductCard(product: products[3]),
        ],
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);

  final _whiteBoldS32Style = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);
  final _blackS18Style = TextStyle(color: Colors.black, fontSize: 18);

  final _circularBorder30 = BorderRadius.circular(30);

  final _insets26 = EdgeInsets.all(26);
  final _insetsL20 = EdgeInsets.only(left: 20);
  final _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  final _backContainer1 = Container(
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      color: Colors.orangeAccent.shade700,
    ),
    width: double.infinity,
  );

  final _backContainer2 = Container(
    margin: EdgeInsets.only(left: 90, bottom: 20),
    width: 299,
    height: 279,
    decoration: BoxDecoration(
      color: Colors.orangeAccent.shade400,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(160),
        bottomLeft: Radius.circular(290),
        bottomRight: Radius.circular(160),
        topRight: Radius.circular(10),
      ),
    ),
  );

  final _searchDecoration = InputDecoration(
    hintText: 'Search...',
    suffixIcon: Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(30),
      child: Icon(Icons.search),
    ),
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13),
  );
}
