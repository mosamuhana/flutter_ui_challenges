import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'models.dart';

List<Post> getPosts() {
  const title = "Lorem ipsum dolor sit amet, consecteutur adsd Ut adipisicing dolore incididunt minim";
  const description = "Mollit aliquip fugiat veniam reprehenderit irure commodo eu aute ex commodo.";

  return [
    Post(title: title, description: description, color: Colors.green.shade200),
    Post(title: title, description: description, color: Colors.red.shade200),
    Post(title: title, description: description, color: Colors.blue.shade200),
    Post(title: title, description: description, color: Colors.yellow.shade200),
  ];
}

List<FeaturedNewsItem> getFeaturedNews() {
  const title = "A complete set of design elements, and their intitutive design.";
  const image = '$STORE_BASE_URL/img%2F2.jpg?alt=media';
  return [
    FeaturedNewsItem(title: title, image: image),
    FeaturedNewsItem(title: title, image: image),
    FeaturedNewsItem(title: title, image: image),
    FeaturedNewsItem(title: title, image: image),
  ];
}
