import '../../../../core/constants.dart';
import 'models.dart';

List<Recipe> getRecipes() {
  return [
    Recipe(
      id: 1,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fbreakfast.jpg?alt=media',
    ),
    Recipe(
      id: 2,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
    ),
    Recipe(
      id: 3,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fcupcake.jpg?alt=media',
    ),
    Recipe(
      id: 4,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media',
    ),
    Recipe(
      id: 5,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Ffries.jpg?alt=media',
    ),
    Recipe(
      id: 6,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media',
    ),
    Recipe(
      id: 7,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fpancake.jpg?alt=media',
    ),
  ];
}

List<Recipe> getSliderItems() {
  var a = getRecipes();
  return [
    a[0],
    a[1],
    a[5],
    a[6],
  ];
}

List<RestaurantSpecialOffer> getRestaurantSpecialOffers() {
  return [
    RestaurantSpecialOffer(
      name: "Burger King",
      image: '$STORE_BASE_URL/food%2Fburger1.jpg?alt=media',
      specials: "Vegetarian, Continental",
    ),
    RestaurantSpecialOffer(
      name: "Cherry Blossom",
      image: '$STORE_BASE_URL/food%2Fcherry.jpg?alt=media',
      specials: "Salads, Dessert",
    ),
    RestaurantSpecialOffer(
      name: "Cupcake Dream",
      image: '$STORE_BASE_URL/food%2Fcupcake.jpg?alt=media',
      specials: "Fast Food",
    ),
    RestaurantSpecialOffer(
      name: "Hungry Kids",
      image: '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media',
      specials: "French Fries",
    ),
  ];
}
