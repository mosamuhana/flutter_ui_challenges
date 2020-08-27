class Profile {
  final String name;
  final String title;
  final String description;
  final String address;
  final String avatar;
  final String email;
  final String phone;
  final List<Skill> skills;
  final List<Experience> experiences;
  final List<Experience> education;
  Profile({
    this.name,
    this.title,
    this.description,
    this.address,
    this.avatar,
    this.email,
    this.phone,
    this.skills,
    this.experiences,
    this.education,
  });
}

class Skill {
  final String name;
  final double level;
  Skill({this.name, this.level});
}

class Experience {
  final String company;
  final String position;
  final String duration;
  Experience({this.company, this.position, this.duration});
}
