import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Profile8Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile8/page.dart";

  final profile = _Profile(
    name: 'Ramesh Mana',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    pannerImage: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    jobPosition: 'Manager',
    location: 'Kathmandu',
    email: 'sudeptech@gmail.com',
    phone: '99--99876-56',
    bio: 'This is a about me link and you can khow about me in this section.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _hbox10,
            _userInfoList,
          ],
        ),
      ),
    );
  }

  Widget get _userInfoList {
    final tiles = <Widget>[
      ListTile(
        title: Text("Location"),
        subtitle: Text('${profile.location}'),
        leading: _myLocationIcon,
      ),
      ListTile(
        title: Text("Email"),
        subtitle: Text('${profile.email}'),
        leading: _emailIcon,
      ),
      ListTile(
        title: Text("Phone"),
        subtitle: Text('${profile.phone}'),
        leading: _phoneIcon,
      ),
      ListTile(
        title: Text("About Me"),
        subtitle: Text('${profile.bio}'),
        leading: _personIcon,
      ),
    ];

    return Container(
      padding: _insets10,
      child: Column(
        children: [
          Container(
            padding: _insetsL8B4,
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: _black87W500S16Style,
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: _insets15,
              child: Column(
                children: [
                  Column(
                    children: ListTile.divideTiles(color: Colors.grey, tiles: tiles).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(profile.pannerImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(color: Colors.black38),
        ),
        Container(
          width: double.infinity,
          height: 200,
          padding: _insetsR0B0,
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                elevation: 0,
                child: Icon(Icons.edit),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: _insetsT160,
          child: Column(
            children: [
              Avatar(
                image: profile.image,
                size: 80,
                borderColor: Colors.grey.shade300,
                borderWidth: 4,
              ),
              Text('${profile.name}', style: Theme.of(context).textTheme.headline6),
              _hbox5,
              Text('${profile.jobPosition}', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
      ],
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);

  final _insets10 = EdgeInsets.all(10);
  final _insets15 = EdgeInsets.all(15);
  final _insetsT160 = EdgeInsets.only(top: 160);
  final _insetsL8B4 = EdgeInsets.only(left: 8, bottom: 4);
  final _insetsR0B0 = EdgeInsets.only(bottom: 0, right: 0);

  final _black87W500S16Style = TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16);

  final _myLocationIcon = Icon(Icons.my_location);
  final _emailIcon = Icon(Icons.email);
  final _phoneIcon = Icon(Icons.phone);
  final _personIcon = Icon(Icons.person);
}

class _Profile {
  final String name;
  final String image;
  final String pannerImage;
  final String jobPosition;
  final String location;
  final String email;
  final String phone;
  final String bio;
  _Profile({
    this.name,
    this.image,
    this.pannerImage,
    this.jobPosition,
    this.location,
    this.email,
    this.phone,
    this.bio,
  });
}
