import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import '../travel_destination_detail/page.dart';
import '../models.dart';
import '../data.dart';

class TravelHome1Page extends StatefulWidget {
  static final String path = "lib/src/pages/travel/travel_home1/page.dart";

  @override
  _TravelHome1PageState createState() => _TravelHome1PageState();
}

class _TravelHome1PageState extends State<TravelHome1Page> {
  final List<String> items = ['Jomsom', 'Palpa', 'Namche'];

  User user;
  List<TravelPlace> places;
  List<bool> favorites;

  int _currentNavIndex = 0;

  @override
  void initState() {
    user = getUser(1);
    places = getTravelPlaces();
    favorites = places.map((x) => false).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(child: _body),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _body {
    switch (_currentNavIndex) {
      case 1:
        return _popularPageContent;
      case 2:
        return _settingsPageContent;
    }
    return _discoverPageContent;
  }

  Widget get _discoverPageContent {
    return ListView(
      children: [
        _userInfo,
        _findDestinationInput,
        ...List.generate(places.length, (index) => _buildTravelPlace(index)),
        ...items.map((item) => _buildItem(item)),
      ],
    );
  }

  Widget get _popularPageContent {
    return Center(child: Text('Popular'));
  }

  Widget get _settingsPageContent {
    return Center(child: Text('Settings'));
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      fixedColor: Colors.red,
      currentIndex: _currentNavIndex,
      onTap: (i) => setState(() => _currentNavIndex = i),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.location_searching), label: "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Popular"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }

  Widget get _userInfo {
    return Container(
      padding: _insetsL16R16B8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello ${user.name},", style: _boldS18Style),
              Text("Where do you want to go?", style: _greyStyle)
            ],
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(user.image),
            radius: 40,
          )
        ],
      ),
    );
  }

  Widget get _findDestinationInput {
    return Container(
      padding: _insetsL16R16B8,
      child: Material(
        elevation: 5,
        child: TextField(
          decoration: _findDestinationDecoration,
        ),
      ),
    );
  }

  Widget _buildTravelPlace(int index) {
    final place = places[index];
    return GestureDetector(
      onTap: () => _openDestinationPage(),
      child: Container(
        padding: _insetsL16T8R16B16,
        child: Material(
          elevation: 5,
          shape: _itemShape,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: _circularBorder5,
                child: CustomImage(place.image, fit: BoxFit.cover),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  onPressed: () => setState(() => favorites[index] = !favorites[index]),
                  icon: favorites[index] ? _favoriteIcon : _favoriteBorderIcon,
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  padding: _insetsH16V8,
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(place.name, style: _whiteBoldS20Style),
                      Text(place.subtitle, style: _whiteStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title) {
    return Container(
      padding: _insetsH16V8,
      child: Material(
        shape: _itemShape,
        elevation: 5,
        child: Container(
          padding: _insets16,
          child: Text(title, style: _s20Style),
        ),
      ),
    );
  }

  void _openDestinationPage() => Navigator.push(context, MaterialPageRoute(builder: (_) => TravelDestinationDetailPage()));

  final _boldS18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final _greyStyle = TextStyle(color: Colors.grey.shade700);
  final _s20Style = TextStyle(fontSize: 20);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _whiteBoldS20Style = TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  final _insets16 = EdgeInsets.all(16);
  final _insetsL16R16B8 = EdgeInsets.only(left: 16, right: 16, bottom: 8);
  final _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  final _insetsL16T8R16B16 = EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16);

  final _findDestinationDecoration = InputDecoration(
    hintText: "Find destination",
    prefixIcon: Icon(Icons.location_on),
    border: InputBorder.none,
  );

  final _circularBorder5 = BorderRadius.circular(5);

  final _itemShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

  final _favoriteBorderIcon = Icon(Icons.favorite_border, color: Colors.white);
  final _favoriteIcon = Icon(Icons.favorite, color: Colors.red);
}
