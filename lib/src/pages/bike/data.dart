import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';
import 'models.dart';

final _bike = Bike(
  name: 'Bajaj Pulsar 220F',
  image: "$STORE_BASE_URL/bike%2Fbike1.jpg?alt=media",
  price: 'Rs. 1,80,000',
  engine: '220 cc',
  mileage: '150 kmpl',
  breaks: 'ABS',
  fuelTank: '12 L',
  year: '2019',
  lot: 'Bagmati 80',
  category: 'Standard',
  engineServiced: 'Half',
  groundClearance: '150 mm',
  seatHeight: '700 mm',
  freeGifts: [
    'helmet',
    'Gloves',
    'Rain Coat',
    'Bike Cover',
  ],
);

class _DummyData {
  final swiperItems = <BikeSwiperItem>[
    BikeSwiperItem(title: 'Buy, Sell, Exchange', subtitle: 'All in one place', icon: FontAwesomeIcons.moneyBill),
    BikeSwiperItem(title: 'Buy, Sell, Exchange', subtitle: 'All in one place', icon: FontAwesomeIcons.moneyBill),
  ];

  final bikes = <Bike>[
    _bike,
    _bike,
    _bike,
    _bike,
  ];

  final List<BikeCategory> categories = [
    BikeCategory(id: 1, name: 'Standard', image: _bikeImage),
    BikeCategory(id: 1, name: 'Cruiser', image: _bikeImage),
    BikeCategory(id: 1, name: 'Sports', image: _bikeImage),
    BikeCategory(id: 1, name: 'Dirt', image: _bikeImage),
    BikeCategory(id: 1, name: 'Scooter', image: _bikeImage),
    BikeCategory(id: 1, name: 'Electric', image: _bikeImage),
  ];
}

final dummyData = _DummyData();

final _bikeImage = "$STORE_BASE_URL/bike%2Fbike1.jpg?alt=media";
