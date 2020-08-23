import 'package:flutter/material.dart';

import '../../../../../core/ui_constants.dart';

class Category extends StatelessWidget {
  final String image, title;

  Category({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: Container(
        height: 140.0,
        width: 130.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            title != 'Load eSewa'
                ? Image.asset(
                    image,
                    height: 50.0,
                    color: Colors.red[900],
                  )
                : Image.asset(
                    image,
                    height: 40.0,
                  ),
            hSizedBox15,
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
