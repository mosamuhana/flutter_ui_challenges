import 'package:flutter/material.dart';

import 'item.dart';

class SchoolItem extends StatelessWidget {
  final Item item;

  SchoolItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _containerDecoration,
      width: double.infinity,
      height: 110,
      margin: _insetsH20V10,
      padding: _insetsH20V10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo,
          _details,
        ],
      ),
    );
  }

  Widget get _logo {
    return Container(
      width: 50,
      height: 50,
      margin: _insetsR15,
      decoration: BoxDecoration(
        borderRadius: _circularBorder50,
        border: _itemLogoBorder,
        image: DecorationImage(
          image: NetworkImage(item.logo),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget get _details {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.name, style: _itemNameStyle),
          _hbox6,
          Row(
            children: [
              _locationOnIcon,
              _wbox5,
              Text(item.location, style: _itemInfoStyle),
            ],
          ),
          _hbox6,
          Row(
            children: [
              _schoolIcon,
              _wbox5,
              Text(item.type, style: _itemInfoStyle),
            ],
          ),
        ],
      ),
    );
  }

  final _hbox6 = SizedBox(height: 6);
  final _wbox5 = SizedBox(width: 5);

  final _itemNameStyle = TextStyle(color: _primaryColor, fontWeight: FontWeight.bold, fontSize: 18);
  final _itemInfoStyle = TextStyle(color: _primaryColor, fontSize: 13, letterSpacing: 0.3);

  final _locationOnIcon = Icon(Icons.location_on, color: _secondaryColor, size: 20);
  final _schoolIcon = Icon(Icons.school, color: _secondaryColor, size: 20);

  final _circularBorder50 = BorderRadius.circular(50);
  final _itemLogoBorder = Border.all(width: 2, color: _secondaryColor);

  final _insetsH20V10 = EdgeInsets.symmetric(vertical: 10, horizontal: 20);
  final _insetsR15 = EdgeInsets.only(right: 15);

  final _containerDecoration = BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white);
}

const _primaryColor = Color(0xff696b9e);
const _secondaryColor = Color(0xfff29a94);
