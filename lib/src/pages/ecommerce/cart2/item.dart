class Item {
  final int id;
  final String name;
  final String image;
  final double price;
  final double subtotal;
  int count;
  Item({
    this.id,
    this.name,
    this.image,
    this.price,
    this.subtotal,
    this.count,
  });

  @override
  String toString() {
    return 'Item {id: $id, name: $name}';
  }
}
