import 'package:flutter/material.dart';

import 'models.dart';
import 'rating_widget.dart';

class HotelDetailsPage extends StatelessWidget {
  final Room room;

  HotelDetailsPage({Key key, @required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 400,
            child: Image.asset(room.image, fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            padding: _insetsT16B20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _hbox250,
                Padding(
                  padding: _insetsH16,
                  child: Text("${room.title}\n${room.subtitle}", style: _whiteBoldS28Style),
                ),
                Row(
                  children: [
                    _wbox16,
                    Container(
                      padding: _insetsH16V8,
                      decoration: _reviewsDecoration,
                      child: Text("${room.reviews} reviews", style: _whiteS13Style),
                    ),
                    _spacer,
                    IconButton(
                      color: Colors.white,
                      icon: _favoriteBorderIcon,
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  padding: _insets32,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingWidget(value: room.rating, color: Colors.purple),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      WidgetSpan(child: _locationOnIcon),
                                      TextSpan(text: '${room.location}'),
                                    ],
                                  ),
                                  style: _greyS12Style,
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text("\$ ${room.price}", style: _purpleBoldS20Style),
                              Text("/per night", style: _greyS12Style)
                            ],
                          )
                        ],
                      ),
                      _hbox30,
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: _bookNowButtonShape,
                          color: Colors.purple,
                          textColor: Colors.white,
                          child: Text("Book Now", style: _normalStyle),
                          padding: _insetsH32V16,
                          onPressed: () {},
                        ),
                      ),
                      _hbox30,
                      Text('DESCRIPTION', style: _w600S14Style),
                      _hbox10,
                      for (var desc in room.description.split('\n')) ...[
                        Text(desc, textAlign: TextAlign.justify, style: _w300S14Style),
                        _hbox10,
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _appBar,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _bottomNavigationBar,
          )
        ],
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      backgroundColor: Colors.white54,
      elevation: 0,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: _searchIcon, label: "Search"),
        BottomNavigationBarItem(icon: _favoriteBorderIcon, label: "Favorites"),
        BottomNavigationBarItem(icon: _settingsIcon, label: "Settings"),
      ],
    );
  }

  Widget get _appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text("DETAIL", style: _normalS16Style),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox30 = SizedBox(height: 30);
  final _hbox250 = SizedBox(height: 250);
  final _wbox16 = SizedBox(width: 16);

  final _whiteBoldS28Style = TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold);
  final _whiteS13Style = TextStyle(color: Colors.white, fontSize: 13);
  final _greyS12Style = TextStyle(color: Colors.grey, fontSize: 12);
  final _purpleBoldS20Style = TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20);
  final _w600S14Style = TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
  final _w300S14Style = TextStyle(fontWeight: FontWeight.w300, fontSize: 14);
  final _normalStyle = TextStyle(fontWeight: FontWeight.normal);
  final _normalS16Style = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

  final _insets32 = EdgeInsets.all(32);
  final _insetsT16B20 = EdgeInsets.only(top: 16, bottom: 20);
  final _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);
  final _insetsH32V16 = EdgeInsets.symmetric(horizontal: 32, vertical: 16);

  final _reviewsDecoration = BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20));

  final _locationOnIcon = Icon(Icons.location_on, size: 16, color: Colors.grey);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _searchIcon = Icon(Icons.search);
  final _settingsIcon = Icon(Icons.settings);

  final _spacer = Spacer();

  final _bookNowButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
}
