import 'models.dart';

List<Room> getRooms() {
  const _description =
      'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?\n' +
          'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?';

  return [
    Room(
      id: 1,
      image: "assets/hotel/room1.jpg",
      title: "Awesome room near Bouddha",
      subtitle: 'Bouddha, Kathmandu',
      description: _description,
      location: '8 km to centrum',
      rating: 4,
      reviews: '8.4/85',
      price: 200,
    ),
    Room(
      id: 2,
      image: "assets/hotel/room2.jpg",
      title: "Peaceful Room",
      subtitle: 'Bouddha, Kathmandu',
      description: _description,
      location: '8 km to centrum',
      rating: 4,
      reviews: '8.4/85',
      price: 140,
    ),
    Room(
      id: 3,
      image: "assets/hotel/room3.jpg",
      title: "Lux Hotel",
      subtitle: 'Toronto',
      description: _description,
      location: '8 km to centrum',
      rating: 4,
      reviews: '8.4/85',
      price: 120,
    ),
    Room(
      id: 4,
      image: "assets/hotel/room4.jpg",
      title: "Vintage room near Pashupatinath",
      subtitle: 'Bouddha, Kathmandu',
      description: _description,
      location: '8 km to centrum',
      rating: 4,
      reviews: '220',
      price: 90,
    ),
  ];
}

Room getRoom(int id) {
  return getRooms().firstWhere((x) => x.id == id, orElse: () => null);
}
