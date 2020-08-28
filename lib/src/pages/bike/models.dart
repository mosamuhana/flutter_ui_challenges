import 'package:flutter/material.dart';

class Bike {
  final String name;
  final String image;
  final String price;
  final String engine;
  final String mileage;
  final String breaks;
  final String fuelTank;
  final String year;
  final String lot;
  final String category;
  final String engineServiced;
  final String groundClearance;
  final String seatHeight;
  final List<String> freeGifts;
  Bike({
    this.name,
    this.image,
    this.price,
    this.engine,
    this.mileage,
    this.breaks,
    this.fuelTank,
    this.year,
    this.lot,
    this.category,
    this.engineServiced,
    this.groundClearance,
    this.seatHeight,
    this.freeGifts,
  });
}

class BikeSwiperItem {
  final String title;
  final String subtitle;
  final IconData icon;
  BikeSwiperItem({this.title, this.subtitle, this.icon});
}

class BikeCategory {
  final int id;
  final String name;
  final String image;
  BikeCategory({this.id, this.name, this.image});
}
