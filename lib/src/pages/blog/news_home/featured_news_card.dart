import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'models.dart';

class FeaturedNewsCard extends StatelessWidget {
  final FeaturedNewsItem item;

  FeaturedNewsCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insets8,
      child: RoundedContainer(
        borderRadius: _circularBorder4,
        margin: _insetsB10,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _wbox10,
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: PNetworkImage(
                  item.image,
                  fit: BoxFit.cover,
                  height: 210,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10);

  final _insets8 = EdgeInsets.all(8);
  final _insetsB10 = EdgeInsets.only(bottom: 20);

  final _circularBorder4 = BorderRadius.circular(4);
}
