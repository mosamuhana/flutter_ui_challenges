class Profile {
  final String name;
  final String jobDescription;
  final String avatar;
  final String panner;
  final List<Favorite> favorites;
  final List<String> friends;
  Profile({
    this.name,
    this.jobDescription,
    this.avatar,
    this.panner,
    this.favorites,
    this.friends,
  });
}

class Favorite {
  final String title;
  final String image;
  Favorite({this.title, this.image});
}
