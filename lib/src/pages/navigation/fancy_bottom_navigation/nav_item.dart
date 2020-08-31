import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final String title;

  NavItem({
    @required this.icon,
    @required this.title,
  }) {
    assert(icon != null);
    assert(title != null);
  }
}
