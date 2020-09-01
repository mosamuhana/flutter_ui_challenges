import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'fashion_item_page.dart';
import 'shop_item.dart';

class ShopItemCard extends StatelessWidget {
  final ShopItem item;

  ShopItemCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => FashionItemPage(item: item))),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: item.tag,
                child: CustomImage(item.image, fit: BoxFit.cover),
              ),
            ),
            _hbox10,
            Text(item.title, softWrap: true),
            _hbox10,
            Text(item.price, style: _redBoldS18Style),
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _redBoldS18Style = TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18);
}
