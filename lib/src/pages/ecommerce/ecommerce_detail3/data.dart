import '../../../../core/constants.dart';
import 'product.dart';

Product getProduct() {
  return Product(
    docside: 'Hand-stitched finish. Flexible pebble sole. Made of brown leather with a textured effect',
    details: 'This is the details widget. Here you can see more details of the product',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    price: 35.99,
  );
}
