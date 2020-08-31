import '../../../../core/constants.dart';
import 'models.dart';

Product getProduct() {
  return Product(
    name: 'Avocado',
    price: 1.8,
    image: '$STORE_BASE_URL/food%2Favocado-f.jpg?alt=media',
    hint: '12-14 pieces approx.',
    description: '100 gms for 1-2 pieces',
    calories: 160,
    weight: 1.5,
    favorited: false,
  );
}
