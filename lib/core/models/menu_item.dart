import 'package:flutter/material.dart';

import 'sub_menu_item.dart';

class MenuItem {
  final String title;
  final List<SubMenuItem> items;
  final IconData icon;

  String get fullTitle => "$title (${items?.length ?? 0} layouts)";

  MenuItem({
    Key key,
    @required this.title,
    this.items,
    this.icon = Icons.label_important,
  });
}
