import 'package:flutter/material.dart';

import '../../../../../core/ui_constants.dart';
import '../../util/constant.dart';
import '../../widget/dashboard/category.dart';
import '../heading.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        hSizedBox10,
        Heading(title: 'would you like to?'),
        hSizedBox25,
        Flexible(
          fit: FlexFit.loose,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // primary: true,
            children: categories.map((item) => Category(title: item['title'], image: item['image'])).toList(),
          ),
        ),
      ],
    );
  }
}
