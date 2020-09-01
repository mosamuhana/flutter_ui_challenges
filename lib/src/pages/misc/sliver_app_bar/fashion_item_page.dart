import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'shop_item.dart';

class FashionItemPage extends StatelessWidget {
  final ShopItem item;

  FashionItemPage({Key key, this.item}) : super(key: key);

  String get tag => 'shopItem${item.id}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top quality fashion item'),
      ),
      body: Material(
        child: Container(
          // The blue background emphasizes that it's a new route.
          color: Colors.white,
          padding: _insets16,
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: tag,
                    child: CustomImage(item.image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Text(item.title, softWrap: true),
                SizedBox(height: 10),
                Text(item.price, style: _redBold18Style)
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _redBold18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red);
  final _insets16 = EdgeInsets.all(16);
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------
