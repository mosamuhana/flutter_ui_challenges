import 'package:intl/intl.dart';

class City {
  final String image;
  final String name;
  final double discount;
  final int month;
  final int year;

  City({this.image, this.name, this.discount, this.month, this.year});

  String get monthYear => DateFormat('yyyy MMM').format(DateTime(year, month, 1));
}
