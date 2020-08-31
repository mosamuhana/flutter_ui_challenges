import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color backgroundColor;

  BoxDecoration _decoration;

  CategoryWidget({
    Key key,
    @required this.icon,
    @required this.title,
    this.backgroundColor,
  }) : super(key: key) {
    _decoration = BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(5));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: _decoration,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
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
}
