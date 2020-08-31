import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant.dart';
import '../../models.dart';
import '../../widgets/profile/category.dart';

class ProfileCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (Catg catg in listProfileCategories)
            Category(
              catg: catg,
            )
        ],
      ),
    );
  }
}
