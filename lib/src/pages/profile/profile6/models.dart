import 'package:flutter/material.dart';

class Developer {
  final String firstName;
  final String lastName;
  final String avatar;
  final String backdropPhoto;
  final String location;
  final String biography;
  final List<Video> videos;

  Developer({
    @required this.firstName,
    @required this.lastName,
    @required this.avatar,
    @required this.backdropPhoto,
    @required this.location,
    @required this.biography,
    @required this.videos,
  });

  String get name => '$firstName $lastName';
}

class Video {
  final String title;
  final String thumbnail;
  final String url;

  Video({
    @required this.title,
    @required this.thumbnail,
    @required this.url,
  });
}
