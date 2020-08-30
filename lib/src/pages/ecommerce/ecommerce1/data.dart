import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/constants.dart';

import 'models.dart';

class _DummyData {
  final navItems = <NavItem>[
    NavItem(id: 'home', title: 'Home', icon: Icons.home),
    NavItem(id: 'messages', title: 'Messages', icon: Icons.message),
    NavItem(id: 'cart', title: 'Cart', icon: Icons.shopping_cart),
    NavItem(id: 'account', title: 'Account', icon: Icons.person),
  ];

  final popularItems = <PopularItem>[
    PopularItem(
      title: 'Vehicles',
      subtitle: '120 people want this',
      image: IMAGE,
    ),
    PopularItem(
      title: 'Vehicles',
      subtitle: '120 people want this',
      image: IMAGE,
    ),
    PopularItem(
      title: 'Vehicles',
      subtitle: '120 people want this',
      image: IMAGE,
    ),
    PopularItem(
      title: 'Vehicles',
      subtitle: '120 people want this',
      image: IMAGE,
    ),
  ];

  final topItems = <TopItem>[
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    ),
    TopItem(
      title: 'Top Quality fashion item',
      price: 'Rs.1,254',
      image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    ),
  ];

  final List<String> categories = [
    'DarazMall',
    'Flash Sales',
    'Collection',
    'Vouchers',
    'Categories',
  ];

  final List<String> images = [
    '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  ];

  final List<String> flashSaleImages = [
    '$STORE_BASE_URL/img%2Fb1.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fb3.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fb2.jpg?alt=media',
  ];
}

final dummyData = _DummyData();

const IMAGE = '$STORE_BASE_URL/img%2Fb2.jpg?alt=media';
