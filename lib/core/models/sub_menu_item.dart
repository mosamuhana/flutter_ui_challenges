import 'package:flutter/material.dart';

class SubMenuItem {
  final String title;
  final Widget page;
  final IconData icon;
  final String path;

  SubMenuItem(
    this.title,
    this.page, {
    this.icon = Icons.block,
    this.path,
  });
}
