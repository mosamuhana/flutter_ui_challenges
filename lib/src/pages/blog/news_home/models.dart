import 'package:flutter/material.dart';

class Post {
  final String title;
  final String description;
  final Color color;
  Post({this.title, this.description, this.color});
}

class FeaturedNewsItem {
  final String title;
  final String image;
  FeaturedNewsItem({this.title, this.image});
}
