import 'package:flutter/material.dart';

import 'product.dart';

class ProductItem extends StatelessWidget {
  final Product item;

  ProductItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _hbox20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$${item.price}", style: _redBoldS18Style),
          ],
        ),
        _hbox20,
        Text(
          '${item.title}',
          textAlign: TextAlign.center,
          style: _s28Style,
        ),
        _hbox10,
        Text(
          '${item.description}',
          textAlign: TextAlign.center,
          style: _grey600Style,
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _grey600Style = TextStyle(color: Colors.grey.shade600);
  final _redBoldS18Style = TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600);
  final _s28Style = TextStyle(fontSize: 28);
}
