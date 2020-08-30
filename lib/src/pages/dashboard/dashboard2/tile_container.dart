import 'package:flutter/material.dart';

class TileContainer extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double height;
  final String title;
  final String subtitle;
  final IconData icon;

  TileContainer({
    Key key,
    this.color = Colors.white,
    @required this.backgroundColor,
    @required this.height,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headline4.copyWith(color: color, fontSize: 24);

    return Container(
      height: height,
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(title, style: titleStyle),
            trailing: Icon(icon, color: color),
          ),
          Padding(
            padding: _insetsL16,
            child: Text(
              subtitle,
              style: TextStyle(color: color),
            ),
          )
        ],
      ),
    );
  }

  final _insetsL16 = EdgeInsets.only(left: 16);
}
