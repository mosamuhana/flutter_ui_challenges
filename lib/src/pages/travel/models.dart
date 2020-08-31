import 'package:intl/intl.dart';

class User {
  final int id;
  final String name;
  final String image;
  User({this.id, this.name, this.image});
}

class TravelPlace {
  final String name;
  final String image;
  final String subtitle;
  TravelPlace({this.name, this.image, this.subtitle});
}

class City {
  final String image;
  final String name;
  final double discount;
  final int month;
  final int year;

  City({this.image, this.name, this.discount, this.month, this.year});

  String get monthYear => DateFormat('yyyy MMM').format(DateTime(year, month, 1));
}

class Place {
  final String title;
  final String image;
  final String description;
  Place({this.title, this.image, this.description});
}
