import 'package:flutter/material.dart';

import '../data.dart';
import '../models.dart';
import 'city_card.dart';
import 'travel_choice_chip.dart';
import 'wave_clipper.dart';

class TravelHome2Page extends StatefulWidget {
  static final String path = "lib/src/pages/travel/travel_home2/page.dart";

  @override
  _TravelHome2PageState createState() => _TravelHome2PageState();
}

class _TravelHome2PageState extends State<TravelHome2Page> {
  List<String> locations;
  List<String> choices;
  List<City> cities;

  List<Widget> choiceIcons;
  TextEditingController searchController;
  int selectedLocationIndex;
  int selectedChoiceIndex;

  @override
  void initState() {
    super.initState();
    choices = getChoices();
    locations = getLocationNames();
    cities = getCities();
    selectedLocationIndex = 0;
    selectedChoiceIndex = 0;

    //_searchController = TextEditingController(text: _locations[0]);
    searchController = TextEditingController(text: locations[0]);
    choiceIcons = [_flightTakeoffIcon, _hotelIcon];
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              _topSection,
              _cityList,
            ],
          ),
          _appBar,
        ],
      ),
    );
  }

  Widget get _appBar {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            _locationOnIcon,
            _wbox16,
            PopupMenuButton(
              onSelected: (int index) => setState(() => selectedLocationIndex = index),
              child: Row(
                children: [
                  Text(locations[selectedLocationIndex], style: _whiteS16Style),
                  _keyboardArrowDownIcon,
                ],
              ),
              itemBuilder: (_) => List.generate(locations.length, (index) {
                return PopupMenuItem<int>(
                  child: Text(locations[index], style: _blackS18Style),
                  value: index,
                );
              }),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: _insetsH8,
            child: IconButton(
              icon: _settingsIcon,
              onPressed: () => print('Settings'),
              splashRadius: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _topSection {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 350,
            decoration: _decoration,
            child: Column(
              children: [
                _hbox80,
                Container(
                  child: Text(
                    "Where do you want to go ?",
                    textAlign: TextAlign.center,
                    style: _whiteS22Style,
                  ),
                ),
                _hbox20,
                Padding(
                  padding: _insetsH32,
                  child: Material(
                    elevation: 5,
                    borderRadius: _circularBorder30,
                    child: TextField(
                      controller: searchController,
                      cursorColor: Theme.of(context).primaryColor,
                      style: _blackS18Style,
                      decoration: InputDecoration(
                        suffixIcon: Material(
                          elevation: 2,
                          borderRadius: _circularBorder30,
                          child: _searchIcon,
                        ),
                        border: InputBorder.none,
                        contentPadding: _insetsH25V13,
                      ),
                    ),
                  ),
                ),
                _hbox20,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(choices.length, (index) {
                    return TravelChoiceChip(
                      onTap: () => setState(() => selectedChoiceIndex = index),
                      selected: selectedChoiceIndex == index,
                      label: choices[index],
                      avatar: choiceIcons[index],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _cityList {
    return Column(
      children: [
        Padding(
          padding: _insets16,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Currently Watched Items", style: _black87W700S15Style),
              _spacer,
              Text("View All", style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
            ],
          ),
        ),
        Container(
          height: 210,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(cities.length, (i) => CityCard(city: cities[i])),
          ),
        ),
      ],
    );
  }

  final _wbox16 = SizedBox(width: 16);

  final _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);
  final _blackS18Style = TextStyle(color: Colors.black, fontSize: 18);
  final _whiteS22Style = TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal);
  final _black87W700S15Style = TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w700);

  final _locationOnIcon = Icon(Icons.location_on, color: Colors.white);
  final _keyboardArrowDownIcon = Icon(Icons.keyboard_arrow_down, color: Colors.white);
  final _settingsIcon = Icon(Icons.settings, color: Colors.white);
  final _searchIcon = Icon(Icons.search);
  final _flightTakeoffIcon = Icon(Icons.flight_takeoff, size: 20, color: Colors.white);
  final _hotelIcon = Icon(Icons.hotel, size: 20, color: Colors.white);

  final _hbox20 = SizedBox(height: 20);
  final _hbox80 = SizedBox(height: 80);

  final _insetsH8 = EdgeInsets.symmetric(horizontal: 8);
  final _insetsH32 = EdgeInsets.symmetric(horizontal: 32);
  final _insetsH25V13 = EdgeInsets.symmetric(horizontal: 25, vertical: 13);
  final _insets16 = EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  final _decoration = BoxDecoration(gradient: LinearGradient(colors: [Color(0xfffb53c6), Color(0xffb91d73)]));

  final _circularBorder30 = BorderRadius.circular(30);

  final _spacer = Spacer();
}
