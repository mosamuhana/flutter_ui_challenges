import 'package:flutter/material.dart';

class GroceryTitle extends StatelessWidget {
  const GroceryTitle({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
    );
  }
}
