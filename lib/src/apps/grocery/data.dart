import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import 'models.dart';

List<GroceryItem> getGroceryItems() {
  return [
    GroceryItem(
      id: 1,
      title: 'Cabbage',
      description: _lorem,
      package: '1 kg',
      image: _cabbage,
      price: 1.5,
      category: 'Vegetables',
    ),
    GroceryItem(
      id: 2,
      title: 'Red/yellow Capsicum',
      description: _lorem,
      package: '1 kg',
      image: _capsicum,
      price: 2.25,
      category: 'Vegetables',
    ),
    GroceryItem(
      id: 3,
      title: 'Pineapple',
      description: _lorem,
      package: '4 in a pack',
      image: _pineapple,
      price: 15,
      category: 'Fruite',
    ),
    GroceryItem(
      id: 4,
      title: 'Local Mango',
      description: _lorem,
      package: '1 kg',
      image: _mango,
      price: 8.5,
      category: 'Fruite',
    ),
    GroceryItem(
      id: 5,
      title: 'Broccoli',
      description: _lorem,
      package: '6 in a pack',
      image: _brocoli,
      price: 5,
      category: 'Vegetables',
    ),
  ];
}

GroceryItem getGroceryItem(int id) {
  return getGroceryItems().firstWhere((x) => x.id == id, orElse: () => null);
}

List<GroceryItem> getRelatedItem(int id) {
  var items = getGroceryItems();
  var item = items.firstWhere((x) => x.id == id, orElse: () => null);
  if (item == null) return [];
  return items.where((x) => x.category == item.category && x.id != id).toList();
}

List<GroceryItem> getDailyNeedsItems() {
  var a = getGroceryItems();
  return [a[0], a[1], a[2]];
}

List<GroceryItem> getNewArrivalItems() {
  var a = getGroceryItems();
  return [a[3], a[4]];
}

List<CartItem> getCartItems() {
  var a = getGroceryItems();
  return [
    CartItem(
      item: a[0],
      quantity: 1,
    ),
    CartItem(
      item: a[2],
      quantity: 1,
    ),
  ];
}

List<CartItem> getWishCartItems() {
  var a = getGroceryItems();
  return [
    CartItem(
      item: a[1],
      quantity: 1,
    ),
    CartItem(
      item: a[3],
      quantity: 1,
    ),
  ];
}

List<Category> getCategories() {
  return [
    Category(
      id: 1,
      title: 'Vegetables',
      image: _vegetables,
      color: Color.fromRGBO(11, 200, 0, 0.15),
    ),
    Category(
      id: 2,
      title: 'Fruite',
      image: _fruit,
      color: Color.fromRGBO(200, 0, 11, 0.15),
    ),
    Category(
      id: 3,
      title: 'Masala',
      image: _mortar,
      color: Color.fromRGBO(20, 20, 15, 0.15),
    ),
  ];
}

const _cabbage = '$STORE_BASE_URL/grocery%2Fcabbage.png?alt=media';
const _capsicum = '$STORE_BASE_URL/grocery%2Fcapsicum.png?alt=media';
const _pineapple = '$STORE_BASE_URL/grocery%2Fpineapple.png?alt=media';

const _mango = '$STORE_BASE_URL/grocery%2Fmango.png?alt=media';
const _brocoli = '$STORE_BASE_URL/grocery%2Fbrocoli.png?alt=media';

const _vegetables = '$STORE_BASE_URL/grocery%2Fvegetables.png?alt=media';
const _fruit = '$STORE_BASE_URL/grocery%2Ffruit.png?alt=media';
const _mortar = '$STORE_BASE_URL/grocery%2Fmortar.png?alt=media';

const _lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras scelerisque nibh ut eros suscipit, vel cursus dolor imperdiet. Proin volutpat ligula eget purus maximus tristique. Pellentesque ullamcorper libero vitae metus feugiat fringilla. Ut luctus neque sed tortor placerat, faucibus mollis risus ullamcorper. Cras at nunc et odio ultrices tempor et.';
