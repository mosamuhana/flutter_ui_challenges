import '../../../../core/constants.dart';

class Recipe {
  final int id;
  final String title;
  final String image;
  Recipe({this.id, this.title, this.image});
}

class RestaurantSpecialOffer {
  final String name;
  final String image;
  final String specials;
  RestaurantSpecialOffer({this.name, this.image, this.specials});
}

// -----------------------------------------------------------------------------
// Data ------------------------------------------------------------------------
// -----------------------------------------------------------------------------

const String _breakfastImage = '$STORE_BASE_URL/food%2Fbreakfast.jpg?alt=media';
const String _burgerImage = '$STORE_BASE_URL/food%2Fburger.jpg?alt=media';
const String _cupcakeImage = '$STORE_BASE_URL/food%2Fcupcake.jpg?alt=media';
const String _frenchFriesImage = '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media';
const String _friesImage = '$STORE_BASE_URL/food%2Ffries.jpg?alt=media';
const String _mealImage = '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media';
const String _pancakeImage = '$STORE_BASE_URL/food%2Fpancake.jpg?alt=media';
const String _burger1Image = '$STORE_BASE_URL/food%2Fburger1.jpg?alt=media';
const String _cherryImage = '$STORE_BASE_URL/food%2Fcherry.jpg?alt=media';

final recipeList = <Recipe>[
  Recipe(id: 1, title: 'French\nToast', image: _breakfastImage),
  Recipe(id: 2, title: 'French\nToast', image: _burgerImage),
  Recipe(id: 3, title: 'French\nToast', image: _cupcakeImage),
  Recipe(id: 4, title: 'French\nToast', image: _frenchFriesImage),
  Recipe(id: 5, title: 'French\nToast', image: _friesImage),
  Recipe(id: 6, title: 'French\nToast', image: _mealImage),
  Recipe(id: 7, title: 'French\nToast', image: _pancakeImage),
];

final List<Recipe> sliderItems = [
  recipeList[0],
  recipeList[1],
  recipeList[5],
  recipeList[6],
];

final restaurantSpecialOffers = <RestaurantSpecialOffer>[
  RestaurantSpecialOffer(
    name: "Burger King",
    image: _burger1Image,
    specials: "Vegetarian, Continental",
  ),
  RestaurantSpecialOffer(
    name: "Cherry Blossom",
    image: _cherryImage,
    specials: "Salads, Dessert",
  ),
  RestaurantSpecialOffer(
    name: "Cupcake Dream",
    image: _cupcakeImage,
    specials: "Fast Food",
  ),
  RestaurantSpecialOffer(
    name: "Hungry Kids",
    image: _frenchFriesImage,
    specials: "French Fries",
  ),
];
