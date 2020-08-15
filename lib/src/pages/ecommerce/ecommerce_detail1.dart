import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class EcommerceDetailOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail1.dart";

  @override
  _EcommerceDetailOnePageState createState() => _EcommerceDetailOnePageState();
}

class _EcommerceDetailOnePageState extends State<EcommerceDetailOnePage> {
  _Product selectedProduct;

  @override
  void initState() {
    super.initState();
    selectedProduct = _products[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        child: Stack(
          children: [
            _productDetails,
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
      title: Text(
        "Woman Apperals",
        style: _grey800Style,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget get _productDetails {
    return Container(
      height: double.infinity,
      child: ListView(
        padding: _insets20,
        children: [
          _productImage,
          _hbox20,
          _productPrice,
          _hbox20,
          _productTitle,
          _hbox10,
          _productDescription,
          _hbox20,
          _productList,
          _hbox40,
        ],
      ),
    );
  }

  Widget get _productImage {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(selectedProduct.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget get _productPrice {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("\$${selectedProduct.price}", style: _redBold18Style),
      ],
    );
  }

  Widget get _productTitle {
    return Text(
      '${selectedProduct.title}',
      textAlign: TextAlign.center,
      style: _s28Style,
    );
  }

  Widget get _productDescription {
    return Text(
      '${selectedProduct.description}',
      textAlign: TextAlign.center,
      style: _grey600Style,
    );
  }

  Widget get _productList {
    return Container(
      margin: _insetsT10,
      padding: _insets10,
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _products.length,
        itemBuilder: (_, i) {
          final product = _products[i];
          return GestureDetector(
            child: _ProductItem(product: product),
            onTap: () {
              selectedProduct = product;
              setState(() {});
            },
          );
        },
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
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _ProductItem extends StatelessWidget {
  final _Product product;

  const _ProductItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PNetworkImage(
          product.image,
          height: 130,
          width: 200,
          fit: BoxFit.fill,
        ),
        Text(product.title, textAlign: TextAlign.center),
      ],
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _products = <_Product>[
  _Product(
    id: 1,
    title: 'Womens Casual Purse',
    description: _loremIpsum,
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    price: 500,
  ),
  _Product(
    id: 2,
    title: 'Womens Hand Bag',
    description: _loremIpsum,
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    price: 400,
  ),
  _Product(
    id: 3,
    title: 'Face Life Style',
    description: _loremIpsum,
    image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    price: 350,
  ),
];

class _Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  _Product({this.id, this.title, this.description, this.image, this.price});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.";

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox40 = SizedBox(height: 40);
const _wbox5 = SizedBox(width: 5);

const _searchIcon = Icon(Icons.search, color: Colors.grey);
const _shoppingBasketIcon = Icon(Icons.shopping_basket, color: Colors.grey);
const _arrowBackIosIcon = Icon(Icons.arrow_back_ios, color: Colors.grey);

final _grey600Style = TextStyle(color: Colors.grey.shade600);
final _grey800Style = TextStyle(color: Colors.grey.shade800);
const _redBold18Style = TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600);
const _s28Style = TextStyle(fontSize: 28);

const _insetsT10 = EdgeInsets.only(top: 10);
const _insets10 = EdgeInsets.all(10);
const _insets20 = EdgeInsets.all(20);
const _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

final _addToCartButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));
