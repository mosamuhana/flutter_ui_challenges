import '../../../../core/constants.dart';
import 'product.dart';

List<Product> getAllProducts() {
  return [
    Product(id: 1, title: 'Brocoli', price: 30, image: '$STORE_BASE_URL/grocery%2Fbrocoli.png?alt=media'),
    Product(id: 2, title: 'Cabbage', price: 37, image: '$STORE_BASE_URL/grocery%2Fcabbage.png?alt=media'),
    Product(id: 3, title: 'Mango', price: 22, image: '$STORE_BASE_URL/grocery%2Fmango.png?alt=media'),
    Product(id: 4, title: 'Pineapple', price: 90, image: '$STORE_BASE_URL/grocery%2Fpineapple.png?alt=media'),
  ];
}
