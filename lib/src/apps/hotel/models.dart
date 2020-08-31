class Room {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String location;
  final String image;
  final String reviews;
  final int rating;
  final double price;
  Room({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.location,
    this.image,
    this.rating = 5,
    this.reviews,
    this.price,
  });
}
