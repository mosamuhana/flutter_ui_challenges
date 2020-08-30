import '../../../../core/constants.dart';
import 'models.dart';

List<Item> getItems() {
  return [
    Item(
      title: 'Cosgrove hat-tricks sparks Aberdeen',
      subtitle: 'Aberdeen',
      date: 'Yesterday, 7:02 PM',
      image: '$STORE_BASE_URL/img%2F5.jpg?alt=media',
    ),
    Item(
      title: 'Cosgrove hat-tricks sparks Aberdeen',
      subtitle: 'Aberdeen',
      date: 'Yesterday, 7:02 PM',
      image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    ),
  ];
}

List<Team> getTeams() {
  return [
    Team(
      name: 'Libertad',
      image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
      score: 0,
    ),
    Team(
      name: 'Gremio',
      image: '$STORE_BASE_URL/img%2F6.jpg?alt=media',
      score: 2,
    ),
  ];
}
