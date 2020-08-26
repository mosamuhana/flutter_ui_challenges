import 'package:flutter/material.dart';

import 'animated_bottom_nav.dart';

class AnimatedBottomBarPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/animated_bottom_bar/page.dart";

  @override
  _AnimatedBottomBarPageState createState() => _AnimatedBottomBarPageState();
}

class _AnimatedBottomBarPageState extends State<AnimatedBottomBarPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Bottom Navigation Bar")),
      backgroundColor: Colors.grey.shade300,
      body: currentPage,
      bottomNavigationBar: AnimatedBottomNav(
        currentIndex: currentIndex,
        onChange: (i) => setState(() => currentIndex = i),
      ),
    );
  }

  Widget get currentPage {
    switch (currentIndex) {
      case 1:
        return Center(child: Container(child: Text("Profile Page")));
      case 2:
        return Center(child: Container(child: Text("Menu Page")));
    }
    return Center(child: Container(child: Text("Home Page")));
  }
}
