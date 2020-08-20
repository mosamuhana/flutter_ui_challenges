import 'package:flutter/material.dart';

import '../../../../core/res/assets.dart';
import '../../../../core/widgets.dart';
import '../destination/page.dart';

class TravelHome1Page extends StatelessWidget {
  static final String path = "lib/src/pages/travel/travel_home1/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello Raj Kumar,", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        "Where do you want to go?",
                        style: TextStyle(color: Colors.grey.shade700),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatars[3]),
                    radius: 40,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Material(
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Find destination", prefixIcon: Icon(Icons.location_on), border: InputBorder.none),
                ),
              ),
            ),
            GestureDetector(
                onTap: () => _openDestinationPage(context),
                child: _buildFeaturedItem(image: kathmandu1, title: "Kathmandu", subtitle: "90 places worth to visit")),
            GestureDetector(
                onTap: () => _openDestinationPage(context),
                child: _buildFeaturedItem(image: fewalake, title: "Pokhara", subtitle: "40 places worth to visit")),
            _buildItem(title: "Jomsom"),
            _buildItem(title: "Palpa"),
            _buildItem(title: "Namche"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.location_searching), title: Text("Discover")),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), title: Text("Popular")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
        ],
      ),
    );
  }

  Widget _buildItem({String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(title,
              style: TextStyle(
                fontSize: 20,
              )),
        ),
      ),
    );
  }

  Container _buildFeaturedItem({String image, String title, String subtitle}) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: PNetworkImage(
                  image,
                  fit: BoxFit.cover,
                )),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(subtitle, style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openDestinationPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationPage()));
  }
}
