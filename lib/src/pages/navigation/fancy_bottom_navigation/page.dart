import 'package:flutter/material.dart';
import 'dart:async';

import 'fancy_bottom_navigation.dart';
import 'nav_item.dart';

class FancyBottomNavigationPage extends StatefulWidget {
  static final String path = "lib/src/pages/navigation/fancy_bottom_navigation/page.dart";

  @override
  _FancyBottomNavigationPageState createState() => _FancyBottomNavigationPageState();
}

class _FancyBottomNavigationPageState extends State<FancyBottomNavigationPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final StreamController<int> _indexController = StreamController<int>.broadcast();

  @override
  void dispose() {
    _indexController.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fancy Bottom Navigation')),
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _body {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      //onPageChanged: (i) => _indexController.add(i),
      children: [
        Center(
          child: Text('Home'),
        ),
        Center(
          child: Text('user'),
        ),
        Center(
          child: Text('Security'),
        ),
        Center(
          child: Text('Message'),
        ),
      ],
    );
  }

  Widget get _bottomNavigationBar {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _indexController.stream,
      builder: (context, snapshot) {
        int index = snapshot.data;
        return FancyBottomNavigation(
          currentIndex: index,
          items: _navitems,
          onItemSelected: (int value) {
            _indexController.add(value);
            _pageController.jumpToPage(value);
          },
        );
      },
    );
  }

  final _navitems = <NavItem>[
    NavItem(icon: Icons.home, title: 'Home'),
    NavItem(icon: Icons.person, title: 'User'),
    NavItem(icon: Icons.security, title: 'Security'),
    NavItem(icon: Icons.message, title: 'Message'),
  ];
}
