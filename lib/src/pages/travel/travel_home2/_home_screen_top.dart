import 'package:flutter/material.dart';

import '_travel_choice_chip.dart';
import '_wave_clipper.dart';

class HomeScreenTop extends StatefulWidget {
  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {
  List<String> _locations = ['Kathmandu', 'Bhaktapur'];
  List<String> _choices = ['Flights', 'Hotel'];
  List<Widget> _choiceIcons;
  TextEditingController _searchController;
  int _selectedLocationIndex = 0;
  int _selectedChoiceIndex = 0;

  //bool get isFlights => _selectedChoiceIndex == 0;
  //bool get isHotel => _selectedChoiceIndex == 1;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: _locations[0]);
    _choiceIcons = [_flightTakeoffIcon, _hotelIcon];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 350,
            decoration: _decoration,
            child: Column(
              children: [
                _hbox10,
                Padding(
                  padding: _insets16,
                  child: Row(
                    children: [
                      _locationOnIcon,
                      _wbox16,
                      _locationMenuButton,
                      _spacer,
                      _settingsIcon,
                    ],
                  ),
                ),
                _hbox30,
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
                    child: _searchField,
                  ),
                ),
                _hbox20,
                _choicesList,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _locationMenuButton {
    return PopupMenuButton(
      onSelected: (int index) => setState(() => _selectedLocationIndex = index),
      child: Row(
        children: [
          Text(_locations[_selectedLocationIndex], style: _whiteS16Style),
          _keyboardArrowDownIcon,
        ],
      ),
      itemBuilder: (_) => _locations
          .asMap()
          .keys
          .map((index) => PopupMenuItem<int>(
                child: Text(_locations[index], style: _blackS18Style),
                value: index,
              ))
          .toList(),
    );
  }

  Widget get _searchField {
    return TextField(
      controller: _searchController,
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
    );
  }

  Widget get _choicesList {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _choices
          .asMap()
          .keys
          .map((index) => TravelChoiceChip(
                onTap: () => setState(() => _selectedChoiceIndex = index),
                selected: _selectedChoiceIndex == index,
                label: _choices[index],
                avatar: _choiceIcons[index],
              ))
          .toList(),
    );
  }

  final _spacer = Spacer();

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
  final _wbox16 = SizedBox(width: 16);

  final _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);
  final _blackS18Style = TextStyle(color: Colors.black, fontSize: 18);
  final _whiteS22Style = TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal);

  final _insets16 = EdgeInsets.all(16);
  final _insetsH32 = EdgeInsets.symmetric(horizontal: 32);
  final _insetsH25V13 = EdgeInsets.symmetric(horizontal: 25, vertical: 13);

  final _decoration = BoxDecoration(gradient: LinearGradient(colors: [Color(0xfffb53c6), Color(0xffb91d73)]));

  final _locationOnIcon = Icon(Icons.location_on, color: Colors.white);
  final _keyboardArrowDownIcon = Icon(Icons.keyboard_arrow_down, color: Colors.white);
  final _settingsIcon = Icon(Icons.settings, color: Colors.white);
  final _searchIcon = Icon(Icons.search);
  final _flightTakeoffIcon = Icon(Icons.flight_takeoff, size: 20, color: Colors.white);
  final _hotelIcon = Icon(Icons.hotel, size: 20, color: Colors.white);

  final _circularBorder30 = BorderRadius.circular(30);
}
