import 'package:flutter/material.dart';

import '../../../core/ui_constants.dart';
import '../widgets/profile/profile_categories.dart';
import '../widgets/profile/profile_detail.dart';
import '../widgets/profile/profile_menu.dart';
import '../widgets/title_large.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 30.0,
        ),
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleLarge(
              title: 'Center',
            ),
            hSizedBox20,
            ProfileDetail(),
            hSizedBox30,
            ProfileCategories(),
            hSizedBox30,
            Flexible(child: ProfileMenu()),
          ],
        ),
      ),
    );
  }
}
