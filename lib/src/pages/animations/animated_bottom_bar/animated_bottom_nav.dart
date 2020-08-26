import 'package:flutter/material.dart';

import 'bottom_nav_item.dart';
import 'nav_item.dart';

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChange;

  final _items = <NavItem>[
    NavItem(title: 'Home', icon: Icons.home),
    NavItem(title: 'User', icon: Icons.verified_user),
    NavItem(title: 'Menu', icon: Icons.menu),
  ];

  AnimatedBottomNav({
    Key key,
    this.currentIndex,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = List.generate(_items.length, (index) {
      return Expanded(
        child: InkWell(
          onTap: () => onChange(index),
          child: BottomNavItem(
            icon: _items[index].icon,
            title: _items[index].title,
            isActive: currentIndex == index,
          ),
        ),
      );
    });

    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(children: children),
    );
  }
}
