import 'package:flutter/material.dart';

import 'models.dart';

class PostCard extends StatelessWidget {
  final Post item;

  PostCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: _insetsH8V4,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: _insetsR10,
              decoration: BoxDecoration(
                borderRadius: _circularBorder10,
                color: item.color,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(item.title, style: _boldStyle),
                  _hbox10,
                  Text(item.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);

  final _insetsR10 = EdgeInsets.only(right: 10);
  final _insetsH8V4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  final _circularBorder10 = BorderRadius.circular(10);
}
