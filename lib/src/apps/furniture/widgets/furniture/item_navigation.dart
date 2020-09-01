import 'package:flutter/material.dart';

import '../../constant.dart';

class ItemNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: furnitureCateDisableColor,
            shape: BoxShape.circle,
          ),
        ),
        _wbox5,
        Container(
          height: 5.0,
          width: 20.0,
          decoration: BoxDecoration(color: Colors.blue[700], borderRadius: BorderRadius.circular(10.0)),
        ),
        _wbox5,
        Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: furnitureCateDisableColor,
            shape: BoxShape.circle,
          ),
        ),
        _wbox5,
        Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: furnitureCateDisableColor,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  final _wbox5 = SizedBox(width: 5.0);
}
