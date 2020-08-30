import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final int value;
  final Color color;

  StatCard({Key key, this.title, this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets8,
      decoration: BoxDecoration(
        borderRadius: _circularBorder10,
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+$value', style: _whiteBoldS20Style),
          _hbox5,
          Text(title.toUpperCase()),
        ],
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _whiteBoldS20Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);

  final _insets8 = EdgeInsets.all(8);

  final _circularBorder10 = BorderRadius.circular(10);
}
