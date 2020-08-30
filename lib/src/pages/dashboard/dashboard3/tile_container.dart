import 'package:flutter/material.dart';

class TileContainer extends StatelessWidget {
  final double height;
  final String title;
  final IconData icon;
  final String data;
  final Color color;
  final Color backgroundColor;

  TileContainer({
    Key key,
    @required this.height,
    @required this.title,
    @required this.icon,
    @required this.data,
    @required this.backgroundColor,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: color, fontWeight: FontWeight.bold);

    return Container(
      padding: _insets8,
      height: height,
      decoration: BoxDecoration(borderRadius: _circularBorder4, color: backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: color),
          Text(title, style: titleStyle),
          Text(data, style: titleStyle.copyWith(fontSize: 20)),
        ],
      ),
    );
  }

  final _insets8 = EdgeInsets.all(8);

  final _circularBorder4 = BorderRadius.circular(4);
}
