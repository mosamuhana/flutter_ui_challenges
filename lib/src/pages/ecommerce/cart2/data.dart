import '../../../../core/constants.dart';
import 'item.dart';

final dummyItemList = <Item>[
  Item(name: 'Item 1', price: 200, subtotal: 250, count: 1, image: ITEM_IMAGE),
  Item(name: 'Item 2', price: 220, subtotal: 300, count: 3, image: ITEM_IMAGE),
  Item(name: 'Item 3', price: 320, subtotal: 400, count: 2, image: ITEM_IMAGE),
  Item(name: 'Item 4', price: 370, subtotal: 420, count: 2, image: ITEM_IMAGE),
  Item(name: 'Item 5', price: 395, subtotal: 500, count: 1, image: ITEM_IMAGE),
  Item(name: 'Item 6', price: 400, subtotal: 510, count: 4, image: ITEM_IMAGE),
];

const ITEM_IMAGE = '$STORE_BASE_URL/img%2F2.jpg?alt=media';
