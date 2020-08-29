import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class EcommerceDetail2Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail2/page.dart";

  @override
  _EcommerceDetail2PageState createState() => _EcommerceDetail2PageState();
}

class _EcommerceDetail2PageState extends State<EcommerceDetail2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            children: [
              PNetworkImage(_image),
              _colorAndSize,
              _productTitle,
              _productRatingAndPrice,
              _productDescription,
            ],
          ),
          /*
          */
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _appBar,
              _bottomBar,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _colorAndSize {
    return Container(
      padding: _insetsH10V5,
      child: Row(
        children: [
          Expanded(
            child: _buildDropdownButton(
              _productColors,
              _product.color,
              (v) => setState(() => _product.color = v),
            ),
          ),
          Expanded(
            child: _buildDropdownButton(
              _productSizes,
              _product.size,
              (v) => setState(() => _product.size = v),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _productTitle {
    return Container(
      padding: _insetsL20R20T10,
      child: Text('${_product.title}', style: _w500S22Style),
    );
  }

  Widget get _productRatingAndPrice {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              _wbox20,
              Rating(value: _product.rating),
              _wbox5,
              Text("${_product.rating} stars", style: _grey14Style),
            ],
          ),
        ),
        Text("\$${_product.price}", style: _red30Style),
        _wbox20,
      ],
    );
  }

  Widget get _productDescription {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: _insetsH20V10,
          child: Text("Description", style: _w400S20Style),
        ),
        Container(
          padding: _insetsL20R20B10,
          child: Text(
            _product.description,
            textAlign: TextAlign.justify,
            style: _greyStyle,
          ),
        ),
      ],
    );
  }

  Widget get _appBar {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Back to Shopping", style: _blackStyle),
      actions: [
        IconButton(
          icon: _favoriteBorderIcon,
          onPressed: () {},
        )
      ],
    );
  }

  Widget get _bottomBar {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MaterialButton(
            color: Colors.deepOrange,
            elevation: 0,
            onPressed: () {},
            child: Container(
              padding: _insets15,
              child: Text(
                "Buy",
                textAlign: TextAlign.center,
                style: _whiteW500S20Style,
              ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            color: Colors.black54,
            elevation: 0,
            onPressed: () {},
            child: Container(
              padding: _insets15,
              child: Text(
                "Add a bag",
                textAlign: TextAlign.center,
                style: _whiteW500S20Style,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownButton(List<String> items, String selectedValue, ValueChanged<String> onChanged) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      onChanged: onChanged,
      items: items
          .map<DropdownMenuItem<String>>((value) => DropdownMenuItem<String>(value: value, child: Text(value)))
          .toList(),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _productColors = ['Black', 'Blue', 'Red'];
final _productSizes = ['S', 'M', 'XL', 'XXL'];

final _product = _Product(
  id: 1,
  title: 'Kapka Valour',
  description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.',
  image: '$STORE_BASE_URL/img%2F5.jpg?alt=media',
  price: 5500,
  color: 'Black',
  size: 'XXL',
  rating: 5,
);

class _Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  String color;
  String size;
  final int rating;
  _Product({this.id, this.title, this.description, this.image, this.price, this.color, this.size, this.rating});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _image = '$STORE_BASE_URL/img%2F5.jpg?alt=media';

const _wbox5 = SizedBox(width: 5);
const _wbox20 = SizedBox(width: 20);

const _blackStyle = TextStyle(color: Colors.black);
const _grey14Style = TextStyle(color: Colors.grey, fontSize: 14);
const _red30Style = TextStyle(color: Colors.red, fontSize: 30);
const _w500S22Style = TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
const _w400S20Style = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
const _whiteW500S20Style = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);
final _greyStyle = TextStyle(color: Colors.grey.shade600);

const _favoriteBorderIcon = Icon(Icons.favorite_border);

const _insetsH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
const _insetsL20R20T10 = EdgeInsets.only(left: 20, right: 20, top: 10);
const _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const _insetsL20R20B10 = EdgeInsets.only(left: 20, right: 20, bottom: 10);
const _insets15 = EdgeInsets.all(15);
