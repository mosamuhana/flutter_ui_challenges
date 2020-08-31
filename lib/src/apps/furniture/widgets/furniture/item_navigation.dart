import 'package:flutter/material.dart';

import '../../../../../core/ui_constants.dart';
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
        wSizedBox5,
        Container(
          height: 5.0,
          width: 20.0,
          decoration: BoxDecoration(color: Colors.blue[700], borderRadius: BorderRadius.circular(10.0)),
        ),
        wSizedBox5,
        Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: furnitureCateDisableColor,
            shape: BoxShape.circle,
          ),
        ),
        wSizedBox5,
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
}
