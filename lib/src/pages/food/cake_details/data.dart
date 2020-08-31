import '../../../../core/constants.dart';
import 'models.dart';

Order getOrder() {
  return Order(
    product: Product(
      name: 'Fruits Cake',
      image: '$STORE_BASE_URL/food%2Fcake.png?alt=media',
      description: 'strawberry & kiwi special',
      prices: {
        '1': 84.99,
        '2': 149.99,
        '3': 229.99,
        '4': 299.99,
      },
      ingredents: [
        Ingredent(title: '4 Eggs', image: '$STORE_BASE_URL/food%2Feggs.png?alt=media'),
        Ingredent(title: '2 tsp vanilla', image: '$STORE_BASE_URL/food%2Fvanilla.png?alt=media'),
        Ingredent(title: '1 cup sugar', image: '$STORE_BASE_URL/food%2Fsugar.png?alt=media'),
      ],
    ),
    delivery: Delivery(
      address1: '45, Amarlands',
      address2: 'Nr. Hamer Road, London',
      rating: 4.5,
    ),
  );
}
