import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import '../models.dart';
import 'grocery_subtitle.dart';
import 'grocery_title.dart';

class GroceryNewArrivalItem extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onTap;
  final VoidCallback onAddtoCart;

  GroceryNewArrivalItem({
    Key key,
    @required this.item,
    this.onTap,
    this.onAddtoCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: _mainDecoration,
        margin: _insets10,
        child: Column(
          children: [
            _content,
            _addToCartButton,
          ],
        ),
      ),
    );
  }

  Widget get _content {
    return Expanded(
      child: Container(
        padding: _insets10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CustomImage(item.image, height: 150)),
            GroceryTitle(text: item.title),
            GrocerySubtitle(text: item.package),
          ],
        ),
      ),
    );
  }

  Widget get _addToCartButton {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: _insets10,
              decoration: _addToCartDecoration,
              child: Text("Add to Cart", textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }

  final _insets10 = EdgeInsets.all(10);

  final _mainDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
    boxShadow: [
      BoxShadow(blurRadius: 10, color: Colors.grey.shade200, spreadRadius: 2),
    ],
  );

  final _addToCartDecoration = BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
  );
}
