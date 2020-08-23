import 'package:flutter/material.dart';

import 'shop_item.dart';

class ItemCard extends StatelessWidget {
  final ShopItem item;

  ItemCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: Center(
          child: ListTile(
            leading: CircleAvatar(radius: 40, backgroundImage: NetworkImage(item.image)),
            title: Text(item.title, softWrap: true),
            subtitle: Text(item.price, style: _redBold18Style),
          ),
        ),
      ),
    );
  }

  final _redBold18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red);
}
