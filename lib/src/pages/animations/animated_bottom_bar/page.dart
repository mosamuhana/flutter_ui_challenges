import 'package:flutter/material.dart';

import '../../../../core/ui_constants.dart';

class AnimatedBottomBarPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/animated_bottom_bar/page.dart";

  @override
  _AnimatedBottomBarPageState createState() => _AnimatedBottomBarPageState();
}

class _AnimatedBottomBarPageState extends State<AnimatedBottomBarPage> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Bottom Navigation Bar")),
      backgroundColor: Colors.grey.shade300,
      body: getPage(_currentPage),
      bottomNavigationBar: AnimatedBottomNav(
        currentIndex: _currentPage,
        onChange: (index) => setState(() => _currentPage = index),
      ),
    );
  }

  getPage(int page) {
    switch (page) {
      case 0:
        return Center(child: Container(child: Text("Home Page")));
      case 1:
        return Center(child: Container(child: Text("Profile Page")));
      case 2:
        return Center(child: Container(child: Text("Menu Page")));
    }
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  final _items = <_Item>[
    _Item(title: 'Home', icon: Icons.home),
    _Item(title: 'User', icon: Icons.verified_user),
    _Item(title: 'Menu', icon: Icons.menu),
  ];

  AnimatedBottomNav({
    Key key,
    this.currentIndex,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = _items.asMap();
    final children = map.keys.map((index) => _buildNavItem(map[index], index)).toList();

    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(children: children),
    );
  }

  Widget _buildNavItem(_Item item, int index) {
    return Expanded(
      child: InkWell(
        onTap: () => onChange(index),
        child: BottomNavItem(
          icon: item.icon,
          title: item.title,
          isActive: currentIndex == index,
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;

  const BottomNavItem({
    Key key,
    this.isActive = false,
    this.icon,
    this.activeColor,
    this.inactiveColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive ? _activeContent(context) : _inactiveContent(context),
    );
  }

  Widget _inactiveContent(BuildContext context) {
    return Icon(icon, color: inactiveColor ?? Colors.grey);
  }

  Widget _activeContent(BuildContext context) {
    final color = activeColor ?? Theme.of(context).primaryColor;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          hSizedBox5,
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ],
      ),
    );
  }
}

class _Item {
  final IconData icon;
  final String title;
  _Item({this.icon, this.title});
}
