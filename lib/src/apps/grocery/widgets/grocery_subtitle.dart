import 'package:flutter/material.dart';

class GrocerySubtitle extends StatelessWidget {
  const GrocerySubtitle({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.grey));
  }
}
