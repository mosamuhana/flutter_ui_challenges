class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  Product({
    this.id,
    this.name,
    this.image,
    this.price,
  });

  String get nameTag => 'name_$id';
  String get imageTag => 'image_$id';
  String get priceTag => 'price_$id';
}
