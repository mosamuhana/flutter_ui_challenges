import '../../../../core/constants.dart';
import 'models.dart';

final categories = <Category>[
  Category(id: 1, name: 'Category 1', image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
  Category(id: 2, name: 'Category 2', image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
  Category(id: 3, name: 'Category 3', image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  Category(id: 4, name: 'Category 4', image: '$STORE_BASE_URL/img%2F4.jpg?alt=media'),
  Category(id: 5, name: 'Category 5', image: '$STORE_BASE_URL/img%2F5.jpg?alt=media'),
  Category(id: 6, name: 'Category 6', image: '$STORE_BASE_URL/img%2F6.jpg?alt=media'),
  Category(id: 7, name: 'Category 7', image: '$STORE_BASE_URL/img%2F7.jpg?alt=media'),
];

final products = <Product>[
  Product(id: 1, name: 'Product 1', price: 4000, image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
  Product(id: 2, name: 'Product 2', price: 3000, image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
  Product(id: 3, name: 'Product 3', price: 6000, image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  Product(id: 4, name: 'Product 4', price: 6500, image: '$STORE_BASE_URL/img%2F4.jpg?alt=media'),
  Product(id: 5, name: 'Product 5', price: 4800, image: '$STORE_BASE_URL/img%2F5.jpg?alt=media'),
];
