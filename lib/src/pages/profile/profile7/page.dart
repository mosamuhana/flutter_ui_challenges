import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Profile7Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile7/page.dart";

  final profile = _Profile(
    name: 'Sudip Thapa',
    image: '$STORE_BASE_URL/img%2Frocket.png?alt=media',
    location: 'Kathmandu',
    photos: '150',
    followers: '2,000',
    following: '5,000',
    email: 'sudeptech@gmail.com',
    phone: '99--99876-56',
    bio: 'This is a about me link and you can khow about me in this section.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      floatingActionButton: FloatingActionButton(
        child: _arrowBackIcon,
        onPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                _backHeader,
                Positioned(
                  top: 10,
                  right: 20,
                  child: _settingsIcon,
                ),
                Column(
                  children: [
                    Container(
                      height: 90,
                      margin: _insetsT60,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CustomImage(profile.image),
                      ),
                    ),
                    _hbox5,
                    Text(
                      '${profile.name}',
                      style: _whiteW500S20Style,
                      textAlign: TextAlign.center,
                    ),
                    _hbox5,
                    Text(
                      '${profile.location}',
                      style: _whiteW400S16Style,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: _insetsT77,
                      padding: _insets10,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildCounter('Photos', '150'),
                            _buildCounter('Followers', '2,000'),
                            _buildCounter('Followings', '5,000'),
                          ],
                        ),
                      ),
                    ),
                    _userInfoList,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _userInfoList {
    return Container(
      padding: _insets10,
      child: Column(
        children: [
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: _insets15,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: _black87W500S16Style,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  _divider,
                  Container(
                    child: Column(
                      children: [
                        ListTile(title: Text('Location'), subtitle: Text(profile.location), leading: _myLocationIcon),
                        ListTile(title: Text('Email'), subtitle: Text(profile.email), leading: _emailIcon),
                        ListTile(title: Text('Phone'), subtitle: Text(profile.phone), leading: _phoneIcon),
                        ListTile(title: Text('About Me'), subtitle: Text(profile.bio), leading: _personIcon),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCounter(String name, String value) {
    return Column(
      children: [
        Container(
          padding: _insetsT15B5,
          child: Text(name, style: _black54Style),
        ),
        Container(
          padding: _insetsB15,
          child: Text(value, style: _black87S16Style),
        ),
      ],
    );
  }

  final _backHeader = Container(width: double.infinity, height: 330, color: Colors.deepOrange);

  final _hbox5 = SizedBox(height: 5);

  final _insetsT15B5 = EdgeInsets.only(top: 15, bottom: 5);
  final _insetsB15 = EdgeInsets.only(bottom: 15);
  final _insetsT60 = EdgeInsets.only(top: 60);
  final _insetsT77 = EdgeInsets.only(top: 77);
  final _insets10 = EdgeInsets.all(10);
  final _insets15 = EdgeInsets.all(15);

  final _black54Style = TextStyle(color: Colors.black54);
  final _black87S16Style = TextStyle(color: Colors.black87, fontSize: 16);
  final _whiteW500S20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20);
  final _whiteW400S16Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16);
  final _black87W500S16Style = TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16);

  final _arrowBackIcon = Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back);
  final _settingsIcon = Icon(Icons.settings, color: Colors.white);
  final _myLocationIcon = Icon(Icons.my_location);
  final _emailIcon = Icon(Icons.email);
  final _phoneIcon = Icon(Icons.phone);
  final _personIcon = Icon(Icons.person);

  final _divider = Divider(color: Colors.black38);
}

class _Profile {
  final String name;
  final String image;
  final String location;
  final String photos;
  final String followers;
  final String following;
  final String email;
  final String phone;
  final String bio;
  _Profile({
    this.name,
    this.image,
    this.location,
    this.photos,
    this.followers,
    this.following,
    this.email,
    this.phone,
    this.bio,
  });
}
