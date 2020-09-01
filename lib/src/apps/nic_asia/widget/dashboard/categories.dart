import 'package:flutter/material.dart';

import '../../util/constant.dart';
import '../../widget/dashboard/category.dart';
import '../heading.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _hbox10,
        Heading(title: 'would you like to?'),
        _hbox25,
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

  final _hbox10 = SizedBox(height: 10);
  final _hbox25 = SizedBox(height: 25);
}
