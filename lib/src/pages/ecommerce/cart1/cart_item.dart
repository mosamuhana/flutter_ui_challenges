import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'item.dart';

class CartItem extends StatelessWidget {
  final Item item;

  CartItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: _insetsR30B10,
          child: Material(
            borderRadius: _circularBorder5,
            elevation: 3,
            child: Container(
              padding: _insets16,
              child: Row(
                children: [
                  Container(
                    height: 80,
                    child: CustomImage(item.image),
                  ),
                  _wbox10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: _boldS16Style),
                        _hbox20,
                        Text("\$${item.price}", style: _boldS18Style),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          child: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: MaterialButton(
              shape: _circularShape5,
              padding: _insets0,
              color: Colors.pinkAccent,
              child: _clearIcon,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _wbox10 = SizedBox(width: 10);

  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  final _insets0 = EdgeInsets.all(0);
  final _insets16 = EdgeInsets.all(16);
  final _insetsR30B10 = EdgeInsets.only(right: 30, bottom: 10);

  final _clearIcon = Icon(Icons.clear, color: Colors.white);

  final _circularBorder5 = BorderRadius.circular(5);
  final _circularShape5 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
}
