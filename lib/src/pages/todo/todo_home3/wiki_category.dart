import 'package:flutter/material.dart';

class WikiCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  WikiCategory({Key key, this.icon, this.label, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: _insets26,
          alignment: Alignment.centerRight,
          child: Opacity(opacity: 0.3, child: Icon(icon, size: 40, color: Colors.white)),
          decoration: BoxDecoration(color: color, borderRadius: _circularBorder20),
        ),
        Padding(
          padding: _insets16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              _hbox16,
              Text(label, style: _whiteBoldStyle),
            ],
          ),
        ),
      ],
    );
  }

  final _hbox16 = SizedBox(height: 16);

  final _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final _insets16 = EdgeInsets.all(16);
  final _insets26 = EdgeInsets.all(26);

  final _circularBorder20 = BorderRadius.all(Radius.circular(20));
}
