import 'package:flutter/material.dart';

import 'sub_menu_item.dart';

class MenuItem {
  final String title;
  final List<SubMenuItem> items;
  final IconData icon;

  String get fullTitle {
    final n = items?.length ?? 0;
    return n == 0 ? title : "$title ($n layouts)";
  }

  MenuItem({
    Key key,
    @required this.title,
    this.items,
    this.icon = Icons.label_important,
  });
}
