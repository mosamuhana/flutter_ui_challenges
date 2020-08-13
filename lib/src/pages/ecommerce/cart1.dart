import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class CartOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/cart1.dart";

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
            _cartItemList,
            _details,
          ],
        ),
      ),
    );
  }

  Widget get _cartItemList {
    return Expanded(
      child: ListView.builder(
        padding: _insetsAll16,
        itemCount: _items.length,
        itemBuilder: (_, i) => _CartItem(item: _items[i]),
      ),
    );
  }

  Widget get _details {
    return Container(
      width: double.infinity,
      padding: _insetsAll20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _subtotalRow('Subtotal', '\$50', _greyS16Style),
          _hbox5,
          _subtotalRow('Delivery', '\$05', _greyS16Style),
          _hbox10,
          _subtotalRow('Cart Subtotal', '\$55', _boldS18Style),
          _hbox20,
          _checkoutButton,
        ],
      ),
    );
  }

  Widget get _checkoutButton {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 50,
        color: Colors.pinkAccent,
        child: Text('SECURE CHECKOUT', style: _whiteStyle),
        onPressed: () {},
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
}

// ----------------------------------------------------------------------------------
// Privates ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _CartItem extends StatelessWidget {
  final _Item item;

  const _CartItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: _insetsR30B10,
          child: Material(
            borderRadius: _circularBorder5,
            elevation: 3,
            child: Container(
              padding: _insetsAll16,
              child: Row(
                children: [
                  _image,
                  _wbox10,
                  _info,
                ],
              ),
            ),
          ),
        ),
        _deleteButton,
      ],
    );
  }

  Widget get _image {
    return Container(
      height: 80,
      child: PNetworkImage(item.image),
    );
  }

  Widget get _info {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title, style: _boldS16Style),
          _hbox20,
          Text("\$${item.price}", style: _boldS18Style),
        ],
      ),
    );
  }

  Widget get _deleteButton {
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        child: MaterialButton(
          shape: _circularShape5,
          padding: _insetsAll0,
          color: Colors.pinkAccent,
          child: _clearIcon,
          onPressed: () {},
        ),
      ),
    );
  }
}

final _items = <_Item>[
  _Item(
    title: 'Breakfast Set',
    image: '$STORE_BASE_URL/food%2Fbreakfast.jpg?alt=media',
    price: 20,
  ),
  _Item(
    title: 'Veg Burger',
    image: '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
    price: 30,
  ),
];

class _Item {
  final String title;
  final String image;
  final double price;
  _Item({this.title, this.image, this.price});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox5 = SizedBox(height: 5);
const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _wbox10 = SizedBox(width: 10);

final _pageTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade700);
const _whiteStyle = TextStyle(color: Colors.white);
final _greyS16Style = TextStyle(color: Colors.grey.shade700, fontSize: 16);
const _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

const _insetsAll0 = EdgeInsets.all(0);
const _insetsAll16 = EdgeInsets.all(16);
const _insetsAll20 = EdgeInsets.all(20);
const _insetsR30B10 = EdgeInsets.only(right: 30, bottom: 10);

const _clearIcon = Icon(Icons.clear, color: Colors.white);

final _circularBorder5 = BorderRadius.circular(5);
final _circularShape5 = RoundedRectangleBorder(borderRadius: _circularBorder5);
