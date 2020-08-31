import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import '../models.dart';

class GroceryCategory extends StatelessWidget {
  final Category item;
  final VoidCallback onTap;

  GroceryCategory({
    Key key,
    @required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: _circularBorder5,
        ),
        margin: _insetsV10,
        padding: _insets10,
        width: 100,
        child: Column(
          children: <Widget>[
            PNetworkImage(item.image),
            Text(item.title),
          ],
        ),
      ),
    );
  }

  final _circularBorder5 = BorderRadius.circular(5);
  final _insets10 = EdgeInsets.all(10);
  final _insetsV10 = EdgeInsets.symmetric(vertical: 10);
}
