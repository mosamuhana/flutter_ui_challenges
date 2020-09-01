import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String image, title;

  Category({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        height: 140,
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title != 'Load eSewa' ? Image.asset(image, height: 50, color: Colors.red[900]) : Image.asset(image, height: 40),
            _hbox15,
            Text(
              title,
              textAlign: TextAlign.center,
              style: _boldS15Style,
            )
          ],
        ),
      ),
    );
  }

  final _hbox15 = SizedBox(height: 15);
  final _boldS15Style = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
}
