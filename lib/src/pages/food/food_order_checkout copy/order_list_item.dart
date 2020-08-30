import 'package:flutter/material.dart';

import 'models.dart';

class OrderListItem extends StatefulWidget {
  final OrderItem item;

  OrderListItem({Key key, this.item}) : super(key: key);

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  OrderItem get item => widget.item;

  double get total => item.price * item.quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insetsH8,
      child: Row(
        children: [
          _image,
          _wbox20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.title, style: _blackBoldS18Style),
                _hbox10,
                _counter,
              ],
            ),
          ),
          _wbox10,
          Text("\$${item.price * item.quantity}", style: _greyBoldS20Style),
        ],
      ),
    );
  }

  Widget get _image {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: item.bgColor,
        borderRadius: _circularBorder20,
      ),
      child: item.image != null ? Image.network(item.image, fit: BoxFit.cover) : null,
    );
  }

  Widget get _counter {
    return Container(
      decoration: _counterDecoration,
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            iconSize: 18,
            padding: _insets2,
            icon: Icon(Icons.remove),
            onPressed: () {},
          ),
          Text("${item.quantity}", style: _blackBoldS18Style),
          IconButton(
            iconSize: 18,
            padding: _insets2,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _wbox10 = SizedBox(width: 10);

  final _wbox20 = SizedBox(width: 20);

  final _blackBoldS18Style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);

  final _greyBoldS20Style = TextStyle(color: Colors.grey.shade600, fontSize: 20, fontWeight: FontWeight.bold);

  final _circularBorder20 = BorderRadius.circular(20);

  final _insets2 = EdgeInsets.all(2);

  final _insetsH8 = EdgeInsets.symmetric(horizontal: 8);

  final _counterDecoration = BoxDecoration(
    border: Border.all(color: Colors.grey, width: 1),
    borderRadius: BorderRadius.circular(10),
  );
}
