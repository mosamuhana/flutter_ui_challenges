class Ingredent {
  final String title;
  final String image;
  const Ingredent({
    this.title,
    this.image,
  });
}

class Product {
  final String name;
  final String image;
  final String description;
  final List<Ingredent> ingredents;
  final Map<String, double> prices;

  Product({
    this.name,
    this.image,
    this.description,
    this.prices,
    this.ingredents,
  });
}

class Delivery {
  final String address1;
  final String address2;
  final double rating;

  Delivery({
    this.address1,
    this.address2,
    this.rating,
  });
}

class Order {
  final Product product;
  final Delivery delivery;

  Order({
    this.product,
    this.delivery,
  });
}
