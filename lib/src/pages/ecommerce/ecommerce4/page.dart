import 'package:flutter/material.dart';

import 'foods_page.dart';

class Ecommerce4Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce4/page.dart";

  @override
  _Ecommerce4PageState createState() => _Ecommerce4PageState();
}

class _Ecommerce4PageState extends State<Ecommerce4Page> {
  int currentIndex = 1;
  List<BottomNavigationBarItem> navItems;

  @override
  void initState() {
    super.initState();

    navItems = [
      BottomNavigationBarItem(icon: _calendarTodayIcon, label: "Today's Special"),
      BottomNavigationBarItem(icon: _fastfoodIcon, label: "Foods"),
      BottomNavigationBarItem(icon: _settingsIcon, label: "Settings"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.9),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: navItems,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            currentIndex == 1 ? FoodsPage() : otherPage,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get otherPage {
    var item = navItems[currentIndex];
    var label = item.label;
    var icon = (item.icon as Icon).icon;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80),
          _hbox20,
          Text(label, style: _blackS30Style),
        ],
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);

  final _calendarTodayIcon = Icon(Icons.calendar_today);
  final _fastfoodIcon = Icon(Icons.fastfood);
  final _settingsIcon = Icon(Icons.settings);

  final _blackS30Style = TextStyle(color: Colors.black, fontSize: 30);
}
