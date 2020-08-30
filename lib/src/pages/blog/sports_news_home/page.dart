import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import 'item_tile.dart';
import 'teams_card.dart';
import 'event_card.dart';
import 'models.dart';
import 'data.dart';

class SportsNewsHomePage extends StatefulWidget {
  static final String path = "lib/src/pages/blog/sports_news_home/page.dart";

  final event = Event(
    title: 'Liverpool beat Lyon in Geneva to end pre-season',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    date: 'Yesterday, 9:24 PM',
    category: 'Football',
    isLive: true,
  );

  @override
  _SportsNewsHomePageState createState() => _SportsNewsHomePageState();
}

class _SportsNewsHomePageState extends State<SportsNewsHomePage> {
  int _currentNavIndex = 0;
  int _categoryIndex = 0;

  final items = getItems();
  final teams = getTeams();

  final List<IconData> navIcons = [
    FontAwesomeIcons.listAlt,
    FontAwesomeIcons.bookmark,
    FontAwesomeIcons.chartBar,
    FontAwesomeIcons.clipboard,
  ];

  var categories = <String>['Football', 'Basketball', 'Hockey'];
  var categoryIcons = <IconData>[
    FontAwesomeIcons.footballBall,
    FontAwesomeIcons.basketballBall,
    FontAwesomeIcons.basketballBall,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Feed", style: _blackS30Style),
        actions: [
          IconButton(
            color: Colors.black,
            icon: _searchIcon,
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _bgColor,
        selectedItemColor: _primaryColor,
        unselectedItemColor: Colors.grey.shade700,
        currentIndex: _currentNavIndex,
        onTap: (i) => setState(() => _currentNavIndex = i),
        elevation: 0,
        items: List.generate(navIcons.length, _buildNavItem),
      ),
      body: ListView(
        padding: _insets16,
        children: [
          _categoryList,
          _hbox15,
          TeamsCard(
            team1: teams[0],
            team2: teams[1],
          ),
          _hbox15,
          EventCard(event: widget.event),
          _hbox10,
          _divider,
          _hbox10,
          ItemTile(item: items[0]),
          _hbox10,
          ItemTile(item: items[1]),
        ],
      ),
    );
  }

  Widget get _categoryList {
    return ToggleButtons(
      fillColor: _primaryColor,
      hoverColor: _primaryColor,
      renderBorder: true,
      borderColor: Colors.grey.shade300,
      color: Colors.grey.shade800,
      selectedColor: Colors.white,
      borderRadius: _circularBorder10,
      isSelected: [
        _categoryIndex == 0,
        _categoryIndex == 1,
        _categoryIndex == 2,
      ],
      onPressed: (i) => setState(() => _categoryIndex = i),
      children: List.generate(categories.length, _buildCategoryItem),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(navIcons[index]),
          if (_currentNavIndex == index) Padding(padding: _insetsT4, child: _solidCircleIcon),
        ],
      ),
      label: '',
    );
  }

  Widget _buildCategoryItem(int index) {
    var title = categories[index];
    var icon = categoryIcons[index];
    return Container(
      padding: _insetsL16T16R32B16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          _hbox15,
          Text(title, style: _categoryIndex == index ? _boldS16Style : null),
        ],
      ),
    );
  }

  final _bgColor = Color(0xffF3F3F3);

  final _hbox10 = SizedBox(height: 10);
  final _hbox15 = SizedBox(height: 15);

  final _blackS30Style = TextStyle(color: Colors.black, fontSize: 30);
  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final _insets16 = EdgeInsets.all(16);
  final _insetsT4 = EdgeInsets.only(top: 4);
  final _insetsL16T16R32B16 = EdgeInsets.fromLTRB(16, 16, 32, 16);

  final _circularBorder10 = BorderRadius.circular(10);

  final _divider = Divider();

  final _searchIcon = Icon(Icons.search);
  final _solidCircleIcon = Icon(FontAwesomeIcons.solidCircle, size: 8, color: _primaryColor);
}

final _primaryColor = Color(0xffE70F0B);
