import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'grocery_title.dart';
import 'grocery_subtitle.dart';
import '../models.dart';

class GroceryCartItem extends StatefulWidget {
  final CartItem item;
  final ValueChanged<int> onChange;

  GroceryCartItem({
    Key key,
    @required this.item,
    this.onChange,
  }) : super(key: key);

  @override
  _GroceryCartItemState createState() => _GroceryCartItemState();
}

class _GroceryCartItemState extends State<GroceryCartItem> {
  int count;

  CartItem get cartItem => widget.item;
  GroceryItem get item => widget.item.item;
  double get total => item.price * count;

  @override
  void initState() {
    count = widget.item.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          _wbox10,
          Container(
            height: 80,
            child: PNetworkImage(item.image, height: 80),
          ),
          _wbox10,
          _details,
          _wbox10,
          _counter,
          _wbox10,
        ],
      ),
    );
  }

  Widget get _details {
    return Expanded(
      child: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroceryTitle(text: item.title),
            GrocerySubtitle(text: item.package),
            _hbox10,
            Text('Price: Rs. ${item.price.toStringAsFixed(2)}'),
            _hbox5,
            Text('Total: Rs. ${total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget get _counter {
    const min = 1;
    const max = 10;

    return Column(
      children: [
        IconButton(
          icon: _addCircleIcon,
          color: Colors.green,
          onPressed: count >= max ? null : () => _updateCount(count + 1),
        ),
        Text(
          '$count',
          textAlign: TextAlign.right,
          style: _boldStyle,
        ),
        IconButton(
          icon: _removeCircleIcon,
          color: Colors.red,
          onPressed: count <= min ? null : () => _updateCount(count - 1),
        )
      ],
    );
  }

  void _updateCount(int v) {
    count = v;
    setState(() {});
    widget.onChange?.call(count);
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _wbox10 = SizedBox(width: 10);
  final _addCircleIcon = Icon(Icons.add_circle);
  final _removeCircleIcon = Icon(Icons.remove_circle);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);
}
