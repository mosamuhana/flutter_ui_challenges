import 'package:flutter/material.dart';

class NavItem {
  final String id;
  final String title;
  final IconData icon;
  NavItem({this.id, this.title, this.icon});
}

class PopularItem {
  final String title;
  final String subtitle;
  final String image;
  PopularItem({this.title, this.subtitle, this.image});
}

class TopItem {
  final String title;
  final String price;
  final String image;
  TopItem({this.title, this.price, this.image});
}
