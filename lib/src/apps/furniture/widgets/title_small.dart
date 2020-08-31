import 'package:flutter/material.dart';

import '../../../../core/ui_constants.dart';
import '../constant.dart';

class TitleSmall extends StatelessWidget {
  final String title, subTitle;
  TitleSmall({@required this.title, @required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        wSizedBox10,
        Text(
          '. $subTitle',
          style: TextStyle(
            color: furnitureCateDisableColor,
            fontSize: 12.0,
            letterSpacing: 0.2,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
