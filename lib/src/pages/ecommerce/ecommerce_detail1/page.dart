import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'product.dart';
import 'product_item.dart';
import 'data.dart';

class EcommerceDetail1Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail1/page.dart";

  @override
  _EcommerceDetail1PageState createState() => _EcommerceDetail1PageState();
}

class _EcommerceDetail1PageState extends State<EcommerceDetail1Page> {
  int selectedIndex = 0;
  List<Product> products;

  @override
  void initState() {
    super.initState();
    products = getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: ListView(
                padding: _insets20,
                children: [
                  ProductItem(item: products[selectedIndex]),
                  _hbox20,
                  _productList,
                  _hbox40,
                ],
              ),
            ),
            _addToCartButton,
          ],
        ),
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      actions: [
        IconButton(
          icon: _searchIcon,
          onPressed: () {},
        ),
        IconButton(
          icon: _shoppingBasketIcon,
          onPressed: () {},
        ),
      ],
      leading: IconButton(
        icon: _arrowBackIosIcon,
        onPressed: () => Navigator.pop(context),
      ),
      title: Text("Woman Apperals", style: _grey800Style),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget get _productList {
    return Container(
      margin: _insetsT10,
      padding: _insets10,
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (_, i) => _buildProductItem(i),
        separatorBuilder: (_, i) => _wbox5,
      ),
    );
  }

  Widget get _addToCartButton {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                padding: _insetsH20V10,
                child: RaisedButton(
                  shape: _addToCartButtonShape,
                  onPressed: () {},
                  child: Text("Add to Cart"),
                  color: Colors.orange,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductItem(int index) {
    final product = products[index];
    return GestureDetector(
      child: Column(
        children: [
          CustomImage(
            product.image,
            height: 130,
            width: 200,
            fit: BoxFit.fill,
          ),
          Text(product.title, textAlign: TextAlign.center),
        ],
      ),
      onTap: () {
        selectedIndex = index;
        setState(() {});
      },
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);
  final _wbox5 = SizedBox(width: 5);

  final _searchIcon = Icon(Icons.search, color: Colors.grey);
  final _shoppingBasketIcon = Icon(Icons.shopping_basket, color: Colors.grey);
  final _arrowBackIosIcon = Icon(Icons.arrow_back_ios, color: Colors.grey);

  final _grey800Style = TextStyle(color: Colors.grey.shade800);

  final _insetsT10 = EdgeInsets.only(top: 10);
  final _insets10 = EdgeInsets.all(10);
  final _insets20 = EdgeInsets.all(20);
  final _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  final _addToCartButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));
}
