import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color backgroundColor;

  CategoryWidget({
    Key key,
    @required this.icon,
    @required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(color: backgroundColor, borderRadius: _circularBorder5),
        margin: _insetsV10,
        padding: _insets10,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            _hbox5,
            Text(title, style: _whiteStyle),
          ],
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _circularBorder5 = BorderRadius.circular(5);
  final _insetsV10 = EdgeInsets.symmetric(vertical: 10);
  final _insets10 = EdgeInsets.all(10);
}
