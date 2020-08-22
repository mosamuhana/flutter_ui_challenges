import 'package:flutter/material.dart';

import '_city.dart';
import '_city_card.dart';

class HomeScreenBottom extends StatelessWidget {
  final List<City> cities;

  HomeScreenBottom({
    Key key,
    @required this.cities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: _insets16,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Currently Watched Items", style: _black87W700S15Style),
              _spacer,
              Text("View All", style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
            ],
          ),
        ),
        Container(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: cities.map((x) => CityCard(city: x)).toList(),
          ),
        ),
      ],
    );
  }

  final _spacer = Spacer();

  final _insets16 = EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  final _black87W700S15Style = TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w700);
}
