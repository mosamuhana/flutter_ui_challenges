import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;

  Heading({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset('assets/nicasiaassets/fill_1_copy.png', height: 20.0),
        _wbox15,
        Expanded(
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
        )
      ],
    );
  }

  final _wbox15 = SizedBox(width: 15);
}
