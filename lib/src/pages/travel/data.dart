import '../../../core/constants.dart';
import 'models.dart';

User getUser(int id) {
  return User(
    id: id,
    name: 'Raj Kumar',
    image: _userImage,
  );
}

List<TravelPlace> getTravelPlaces() {
  return [
    TravelPlace(
      name: 'Kathmandu',
      image: _kathmandu1,
      subtitle: '90 places worth to visit',
    ),
    TravelPlace(
      name: 'Pokhara',
      image: _fewalake,
      subtitle: '40 places worth to visit',
    ),
  ];
}

List<City> getCities() {
  const BASE_URL = 'https://cdn.pixabay.com/photo';
  return [
    City(
      image: "$BASE_URL/2013/03/02/02/41/city-89197_960_720.jpg",
      name: "Kathmandu",
      month: 2,
      year: 2012,
      discount: 10,
    ),
    City(
      image: "$BASE_URL/2017/12/10/17/40/prague-3010407_960_720.jpg",
      name: "Bhaktapur",
      month: 2,
      year: 2012,
      discount: 10,
    ),
    City(
      image: "$BASE_URL/2014/07/01/12/35/taxi-cab-381233_960_720.jpg",
      name: "Morang",
      month: 2,
      year: 2012,
      discount: 10,
    ),
  ];
}

List<String> getLocationNames() {
  return ['Kathmandu', 'Bhaktapur'];
}

List<String> getChoices() {
  return ['Flights', 'Hotel'];
}

List<String> getTags() {
  return ['Pokhara', 'Everest base camp', 'Lumbini', 'Annapurna', 'Kathmandu', '10+'];
}

List<String> getImages() {
  return [
    _fewalake,
    _kathmandu1,
    _fishtail,
    _mountEverest,
    _kathmandu2,
  ];
}

List<Place> getPlaces() {
  return [
    Place(title: 'Kathmandu', image: _kathmandu1, description: _description),
    Place(title: 'Pashupatinath', image: _pashupatinath, description: _description),
    Place(title: 'Durbar Square', image: _kathmandu2, description: _description),
    Place(title: 'Pashupatinath', image: _pashupatinath, description: _description),
    Place(title: 'Swoyambhunath', image: _kathmandu2, description: _description),
  ];
}

List<String> getDistinationImages() {
  return [
    _kathmandu1,
    _kathmandu2,
    _pashupatinath,
    _kathmandu1,
  ];
}

const _pashupatinath = '$STORE_BASE_URL/travel%2Fpashupatinath.jpg?alt=media';
const _kathmandu1 = '$STORE_BASE_URL/travel%2Fkathmandu1.jpg?alt=media';
const _kathmandu2 = '$STORE_BASE_URL/travel%2Fkathmandu2.jpg?alt=media';
const _fewalake = '$STORE_BASE_URL/travel%2Ffewalake.jpg?alt=media';
const _userImage = '$STORE_BASE_URL/img%2F7.jpg?alt=media';
const _fishtail = '$STORE_BASE_URL/travel%2Ffishtail.jpg?alt=media';
const _mountEverest = '$STORE_BASE_URL/travel%2Fmount_everest.jpg?alt=media';

const _description =
    'Kathmandu, worlds spiritual capital mixes the traditional cultures of Nepal as well as the modern technology.';
