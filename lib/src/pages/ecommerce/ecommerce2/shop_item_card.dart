import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shop_item.dart';

class ShopItemCard extends StatelessWidget {
  final ShopItem item;

  ShopItemCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insetsH10,
      margin: _insetsB20,
      height: 300,
      child: Row(
        children: [
          _image,
          _details,
        ],
      ),
    );
  }

  Widget get _image {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover),
          borderRadius: _circularBorder10,
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 10),
          ],
        ),
      ),
    );
  }

  Widget get _details {
    return Expanded(
      child: Container(
        padding: _insets20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: _w700S22Style),
            _hbox10,
            Text(item.category, style: _greyS18Style),
            _hbox20,
            Text("\$${item.price}", style: _redS30Style),
            _hbox20,
            Text(item.tags, style: _greyS18Style2)
          ],
        ),
        margin: _insetsV20,
        decoration: _detailsDecoration,
      ),
    );
  }

  final _w700S22Style = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  final _redS30Style = TextStyle(color: Colors.red, fontSize: 30);
  final _greyS18Style = TextStyle(color: Colors.grey, fontSize: 18);
  final _greyS18Style2 = TextStyle(fontSize: 18, color: Colors.grey, height: 1.5);

  final _insetsH10 = EdgeInsets.symmetric(horizontal: 10);
  final _insetsB20 = EdgeInsets.only(bottom: 20);
  final _insets20 = EdgeInsets.all(20);
  final _insetsV20 = EdgeInsets.symmetric(vertical: 20);

  final _circularBorder10 = BorderRadius.circular(10);

  final _detailsDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 10),
    ],
  );

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
}
