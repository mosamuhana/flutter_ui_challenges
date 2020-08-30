import 'package:flutter/material.dart';

class ActionHeading extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  ActionHeading({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insets8,
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: _greyBoldS18Title),
          ),
          MaterialButton(
            elevation: 0,
            textColor: Colors.white,
            color: Colors.teal.shade300,
            height: 0,
            child: _keyboardArrowRightIcon,
            minWidth: 0,
            shape: _headerButtonShape,
            padding: _insets2,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  final _insets2 = EdgeInsets.all(2);
  final _insets8 = EdgeInsets.all(8);

  final _greyBoldS18Title = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600);

  final _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);

  final _headerButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
}
