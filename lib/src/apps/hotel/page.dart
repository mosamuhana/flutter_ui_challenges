import 'package:flutter/material.dart';

import 'category_widget.dart';
import 'hotel_details.dart';
import 'room_widget.dart';
import 'data.dart';

class HotelHomePage extends StatelessWidget {
  static final String path = "lib/src/apps/hotel/page.dart";

  final rooms = getRooms();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: Colors.cyan,
            /*
            leading: IconButton(
              icon: _menuIcon,
              onPressed: () {},
            ),
            */
            actions: [
              IconButton(
                icon: _favoriteBorderIcon,
                onPressed: () {},
              ),
            ],
            floating: true,
            flexibleSpace: ListView(
              children: [
                _hbox70,
                Text("Type your Location", textAlign: TextAlign.center, style: _whiteBoldS20Style),
                Container(
                  margin: _insetsH30V10,
                  padding: _insets5,
                  decoration: _searchFieldDecoration,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Bouddha, Kathmandu",
                      border: InputBorder.none,
                      icon: IconButton(
                        icon: _searchIcon,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: _hbox10,
          ),
          SliverToBoxAdapter(
            child: _categoryList,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var room = rooms[index % rooms.length];
                return RoomWidget(
                  room: room,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HotelDetailsPage(room: room)));
                  },
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _categoryList {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _wbox15,
          CategoryWidget(
            backgroundColor: Colors.pink,
            icon: _hotelIcon,
            title: "Hotel",
          ),
          _wbox15,
          CategoryWidget(
            backgroundColor: Colors.blue,
            title: "Restaurant",
            icon: _restaurantIcon,
          ),
          _wbox15,
          CategoryWidget(
            backgroundColor: Colors.orange,
            title: "Cafe",
            icon: _localCafeIcon,
          )
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox70 = SizedBox(height: 70);
  final _wbox15 = SizedBox(width: 15);

  final _whiteBoldS20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

  final _insetsH30V10 = EdgeInsets.symmetric(horizontal: 30, vertical: 10);
  final _insets5 = EdgeInsets.all(5);

  final _searchFieldDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40));

  final _hotelIcon = Icon(Icons.hotel, color: Colors.white);
  final _restaurantIcon = Icon(Icons.restaurant, color: Colors.white);
  final _localCafeIcon = Icon(Icons.local_cafe, color: Colors.white);
  final _searchIcon = Icon(Icons.search);
  //final _menuIcon = Icon(Icons.menu, color: Colors.white);
  final _favoriteBorderIcon = Icon(Icons.favorite_border, color: Colors.white);
}
