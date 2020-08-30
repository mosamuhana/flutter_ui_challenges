import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'product.dart';
import 'product_item.dart';

class EcommerceDetail2Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail2/page.dart";

  @override
  _EcommerceDetail2PageState createState() => _EcommerceDetail2PageState();
}

class _EcommerceDetail2PageState extends State<EcommerceDetail2Page> {
  final product = Product(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ProductItem(
            item: product,
            onSizeChanged: (size) => setState(() => product.size = size),
            onColorChanged: (color) => setState(() => product.color = color),
          ),
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

  final _blackStyle = TextStyle(color: Colors.black);
  final _whiteW500S20Style = TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500);

  final _favoriteBorderIcon = Icon(Icons.favorite_border);

  final _insets15 = EdgeInsets.all(15);
}
