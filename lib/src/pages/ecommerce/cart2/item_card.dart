import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'data.dart';
import 'item.dart';
import 'item_counter.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: _insets0,
      margin: _insets10,
      height: 130,
      child: Row(
        children: [
          _image,
          Flexible(
            child: Padding(
              padding: _insetsH10,
              child: Column(
                children: [
                  Row(
                    children: [
                      _itemName,
                      _deleteButton,
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
                      _shipsFreeButton,
                      _spacer,
                      ItemCounter(
                        value: item.count,
                        onChange: (value) {
                          print('new value: $value');
                        },
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

  Widget get _image {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ITEM_IMAGE),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget get _itemName {
    return Flexible(
      child: Text(
        '${item.name}',
        overflow: TextOverflow.fade,
        softWrap: true,
        style: _w600S15Style,
      ),
    );
  }

  Widget get _deleteButton {
    return Container(
      width: 50,
      child: IconButton(
        onPressed: () => print("Delete"),
        color: Colors.red,
        icon: Icon(Icons.delete),
        iconSize: 20,
      ),
    );
  }

  Widget get _shipsFreeButton {
    return Text("Ships Free", style: _orangeStyle);
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
