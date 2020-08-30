class Item {
  final String title;
  final String subtitle;
  final String date;
  final String image;
  Item({this.title, this.subtitle, this.date, this.image});
}

class Team {
  final String name;
  final String image;
  final int score;
  Team({this.name, this.image, this.score});
}

class Event {
  final String title;
  final String image;
  final String date;
  final String category;
  final bool isLive;
  Event({this.title, this.image, this.date, this.category, this.isLive = false});
}
