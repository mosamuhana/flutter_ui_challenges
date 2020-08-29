import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'data.dart';
import 'item.dart';
import 'item_counter.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;
  final ValueChanged<int> onChangeCount;

  ItemCard({
    Key key,
    @required this.item,
    this.onDelete,
    this.onChangeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: _insets0,
      margin: _insets10,
      height: 130,
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(ITEM_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: _insetsH10,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item.name}',
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: _w600S15Style,
                      ),
                      Container(
                        width: 50,
                        child: IconButton(
                          onPressed: () => onDelete?.call(),
                          color: Colors.red,
                          icon: Icon(Icons.delete),
                          iconSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price: "),
                      _wbox5,
                      Text('\$${item.price}', style: _w300S16Style),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sub Total: "),
                      _wbox5,
                      Text('\$${item.subtotal}', style: _orangeW300S16Style),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Ships Free", style: _orangeStyle),
                      _spacer,
                      ItemCounter(
                        value: item.count,
                        onChange: (value) => onChangeCount?.call(value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final _spacer = Spacer();

  final _w600S15Style = TextStyle(fontWeight: FontWeight.w600, fontSize: 15);
  final _w300S16Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  final _orangeW300S16Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.orange);
  final _orangeStyle = TextStyle(color: Colors.orange);

  final _insets0 = EdgeInsets.all(0);
  final _insets10 = EdgeInsets.all(10);
  final _insetsH10 = EdgeInsets.symmetric(horizontal: 10);

  final _wbox5 = SizedBox(width: 5);
}
