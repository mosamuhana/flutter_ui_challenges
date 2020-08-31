import '../../../../core/constants.dart';
import 'models.dart';

List<Recipe> getRecipes() {
  final category = 'Vegetarian';
  final calories = '65%';
  final time = '10 min';
  final details = 'In a small bowl, combine,\ncinnamon, nutmeg and sugar and \nset aside briefly.';
  const description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi.';
  const step =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi. Vivamus quis tellus sed erat eleifend pharetra ac non diam. Integer vitae ipsum congue, vestibulum eros quis, interdum tellus. Nunc vel dictum elit. Curabitur suscipit scelerisque.';

  return [
    Recipe(
      id: 1,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fbreakfast.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
    Recipe(
      id: 2,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
    Recipe(
      id: 3,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fcupcake.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
    Recipe(
      id: 4,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
    Recipe(
      id: 5,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Ffries.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
    Recipe(
      id: 6,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
    Recipe(
      id: 7,
      title: 'French\nToast',
      image: '$STORE_BASE_URL/food%2Fpancake.jpg?alt=media',
      category: category,
      calories: calories,
      time: time,
      details: details,
      description: description,
      steps: [step, step, step],
    ),
  ];
}

Recipe getRecipe(int id) {
  return getRecipes().firstWhere((x) => x.id == id, orElse: () => null);
}
