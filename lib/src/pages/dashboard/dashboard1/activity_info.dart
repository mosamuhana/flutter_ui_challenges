import 'package:flutter/material.dart';

class ActivityInfo extends StatelessWidget {
  final String title;
  final IconData icon;

  ActivityInfo({Key key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).buttonColor,
          child: icon != null ? Icon(icon, size: 18) : null,
        ),
        _hbox5,
        Text(
          title,
          textAlign: TextAlign.center,
          style: _boldS14Style,
        ),
      ],
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _boldS14Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
}
