import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Profile5Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile5/page.dart";

  final profile = _Profile(
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    name: 'Sasha',
    age: 22,
    address: 'San Diego, California, USA',
    location: '3.7mi away',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 360,
            decoration: _headerDecoration,
          ),
          Container(
            margin: _insetsT80,
            child: Column(
              children: [
                Text("Date mate", style: _whiteItalicS28Style),
                _hbox20,
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        margin: _insetsL30T10R30,
                        child: ClipRRect(
                          borderRadius: _circularBorder30,
                          child: CustomImage(profile.image, fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: _insetsH10V5,
                          decoration: _locationDecoration,
                          child: Text('${profile.location}'),
                        ),
                      )
                    ],
                  ),
                ),
                _hbox10,
                Text("${profile.name} - ${profile.age}", style: _boldS16Style),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_greyLocationOnIcon, Text('${profile.address}', style: _greyStyle)],
                ),
                _hbox5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialIconButton(type: SocialType.instagram, color: Colors.grey),
                    SocialIconButton(type: SocialType.facebook, color: Colors.grey),
                    SocialIconButton(type: SocialType.twitter, color: Colors.grey),
                  ],
                ),
                _hbox10,
                _bottomBar,
              ],
            ),
          ),
          _appBar,
        ],
      ),
    );
  }

  Widget get _bottomBar {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: _insetsH16V5,
            margin: _insetsL20T30R20B20,
            decoration: _bottomBarDecoration,
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  icon: _userIcon,
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: _locationOnIcon,
                  onPressed: () {},
                ),
                _spacer,
                IconButton(
                  color: Colors.white,
                  icon: _addIcon,
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: _messageIcon,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Center(
            child: FloatingActionButton(
              child: _favoriteIcon,
              backgroundColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: _notificationsIcon,
          onPressed: () {},
        ),
        IconButton(
          icon: _menuIcon,
          onPressed: () {},
        ),
      ],
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _whiteItalicS28Style = TextStyle(color: Colors.white, fontSize: 28, fontStyle: FontStyle.italic);
  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final _greyStyle = TextStyle(color: Colors.grey.shade600);

  final _greyLocationOnIcon = Icon(Icons.location_on, size: 16, color: Colors.grey);
  final _locationOnIcon = Icon(Icons.location_on);
  final _addIcon = Icon(Icons.add);
  final _messageIcon = Icon(Icons.message);
  final _menuIcon = Icon(Icons.menu);
  final _favoriteIcon = Icon(Icons.favorite, color: Colors.pink);
  final _notificationsIcon = Icon(Icons.notifications);
  final _userIcon = Icon(FontAwesomeIcons.user);

  final _insetsT80 = EdgeInsets.only(top: 80);
  final _insetsH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
  final _insetsL30T10R30 = EdgeInsets.only(left: 30, right: 30, top: 10);
  final _insetsH16V5 = EdgeInsets.symmetric(vertical: 5, horizontal: 16);
  final _insetsL20T30R20B20 = EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20);

  final _spacer = Spacer();

  final _circularBorder30 = BorderRadius.circular(30);

  final _locationDecoration = BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20));

  final _headerDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
    gradient: LinearGradient(
      colors: [Color(colorValue1), Color(colorValue2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  final _bottomBarDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(colorValue1), Color(colorValue2)],
    ),
    borderRadius: BorderRadius.circular(30),
  );
}

class _Profile {
  final String name;
  final int age;
  final String address;
  final String image;
  final String location;
  _Profile({this.name, this.age, this.address, this.image, this.location});
}

const colorValue1 = 0xffFC5CF0;
const colorValue2 = 0xffFE8852;
