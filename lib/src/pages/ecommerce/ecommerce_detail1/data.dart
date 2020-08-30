import '../../../../core/constants.dart';
import 'product.dart';

List<Product> getAllProducts() {
  const _loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.";

  return [
    Product(
      id: 1,
      title: 'Womens Casual Purse',
      description: _loremIpsum,
      image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
      price: 500,
    ),
    Product(
      id: 2,
      title: 'Womens Hand Bag',
      description: _loremIpsum,
      image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
      price: 400,
    ),
    Product(
      id: 3,
      title: 'Face Life Style',
      description: _loremIpsum,
      image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
      price: 350,
    ),
  ];
}
