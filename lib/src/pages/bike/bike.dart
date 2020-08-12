import '../../../core/constants.dart';

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

final bike_data = Bike(
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
