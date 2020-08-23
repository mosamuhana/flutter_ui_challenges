class ShopItem {
  final int id;
  final String title;
  final String price;
  final String image;
  ShopItem({this.id, this.title, this.price, this.image});

  String get tag => 'shopItem$id';
}
