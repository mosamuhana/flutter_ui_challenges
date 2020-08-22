import 'package:flutter/material.dart';

import '_home_screen_bottom.dart';
import '_home_screen_top.dart';
import '_data.dart' show cityList;

class TravelHome2Page extends StatelessWidget {
  static final String path = "lib/src/pages/travel/travel_home2/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeScreenTop(),
          HomeScreenBottom(cities: cityList),
        ],
      ),
    );
  }
}
