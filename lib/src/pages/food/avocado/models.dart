class Product {
  double weight;
  final String name;
  final double price;
  final String image;
  final String hint;
  final String description;
  final int calories;
  bool favorited;

  double get totalPrice => weight * price;

  Product({
    this.weight,
    this.name,
    this.price,
    this.image,
    this.hint,
    this.description,
    this.calories,
    this.favorited = false,
  });
}
