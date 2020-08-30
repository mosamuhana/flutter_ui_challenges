import 'package:flutter/material.dart';

import 'data.dart';
import 'home_content.dart';

class Ecommerce1Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce1/page.dart";

  @override
  _Ecommerce1PageState createState() => _Ecommerce1PageState();
}

class _Ecommerce1PageState extends State<Ecommerce1Page> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Flutter UIs'),
        elevation: 0,
      ),
      body: SafeArea(
        child: _buildContent(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: List.generate(dummyData.navItems.length, _buildNavItem),
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (currentIndex == 0) {
      return HomeContentPage();
    }
    return Center(child: Text(dummyData.navItems[currentIndex].title));
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    var item = dummyData.navItems[index];
    return BottomNavigationBarItem(
      icon: Icon(item.icon),
      label: item.title,
    );
  }
}
