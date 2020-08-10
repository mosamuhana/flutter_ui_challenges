import '../../../../core/res/assets.dart' as assets;

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  Product({this.id, this.name, this.imageUrl, this.price});
}

final products = <Product>[
  Product(id: 0, name: 'Beautiful Cardigan', imageUrl: assets.images[0], price: 600.0),
  Product(id: 1, name: 'Leather Bag', imageUrl: assets.images[1], price: 400.0),
  Product(id: 2, name: 'White Beautiful Bag', imageUrl: assets.images[2], price: 350.0),
];
