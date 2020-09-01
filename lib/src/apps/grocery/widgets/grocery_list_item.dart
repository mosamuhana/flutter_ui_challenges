import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'grocery_title.dart';
import 'grocery_subtitle.dart';
import '../models.dart';

class GroceryListItem extends StatelessWidget {
  final GroceryItem item;
  final VoidCallback onTap;

  GroceryListItem({
    Key key,
    @required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: _insetsH16V8,
        child: Row(
          children: [
            _wbox10,
            Container(
              height: 80,
              child: CustomImage(item.image, height: 80),
            ),
            _wbox10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GroceryTitle(text: item.title),
                  GrocerySubtitle(text: item.package),
                ],
              ),
            ),
            _wbox10,
            Column(
              children: [
                IconButton(
                  icon: _favoriteBorderIcon,
                  onPressed: () {},
                ),
                IconButton(
                  icon: _addIcon,
                  color: Colors.green,
                  onPressed: () {},
                )
              ],
            ),
            _wbox10,
          ],
        ),
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10);
  final _insetsH16V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _addIcon = Icon(Icons.add);
}
