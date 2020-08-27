import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class Profile1Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile1/page.dart";

  final profile = _Profile(
    name: 'Ram Kumar',
    address: 'Kathmandu, Nepal',
    email: 'ram@kumar.com',
    phone: '+977 9818225533',
    twitter: '@ramkumar',
    facebook: 'facebook.com/ramkumar',
    followers: 50895,
    following: 34524,
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("View Profile"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: [
          _buildHeader(context),
          _buildCounters(context),
          _buildListItem('Email', profile.email),
          _buildListItem('Phone', profile.phone),
          _buildListItem('Twitter', profile.twitter),
          _buildListItem('Facebook', profile.facebook),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 200,
      decoration: _headerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: CircleAvatar(
                  child: Icon(Icons.call, size: 30),
                  minRadius: 30,
                  backgroundColor: Colors.red.shade600,
                ),
                onTap: () => print('CALL'),
              ),
              CircleAvatar(
                minRadius: 60,
                backgroundColor: Colors.deepOrange.shade300,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profile.image),
                  minRadius: 55,
                ),
              ),
              InkWell(
                child: CircleAvatar(
                  child: Icon(Icons.message, size: 30),
                  minRadius: 30,
                  backgroundColor: Colors.red.shade600,
                ),
                onTap: () => print('MESSAGE'),
              ),
            ],
          ),
          _hbox10,
          Text('${profile.name}', style: _whiteS22Style),
          Text('${profile.address}', style: _redS14Style)
        ],
      ),
    );
  }

  Widget _buildCounters(BuildContext context) {
    return Container(
      // height: 50,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.deepOrange.shade300,
              child: ListTile(
                title: Text(
                  '${profile.followers}',
                  textAlign: TextAlign.center,
                  style: _whiteBoldS24Style,
                ),
                subtitle: Text(
                  "FOLLOWERS",
                  textAlign: TextAlign.center,
                  style: _redStyle,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: ListTile(
                title: Text(
                  '${profile.following}',
                  textAlign: TextAlign.center,
                  style: _whiteBoldS24Style,
                ),
                subtitle: Text(
                  "FOLLOWING",
                  textAlign: TextAlign.center,
                  style: _white70Style,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: _deepOrangeS12Style),
      subtitle: Text(subtitle, style: _s18Style),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _s18Style = TextStyle(fontSize: 18);
  final _redStyle = TextStyle(color: Colors.red);
  final _redS14Style = TextStyle(color: Colors.red.shade700, fontSize: 14);
  final _whiteS22Style = TextStyle(color: Colors.white, fontSize: 22);
  final _white70Style = TextStyle(color: Colors.white70);
  final _whiteBoldS24Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);
  final _deepOrangeS12Style = TextStyle(color: Colors.deepOrange, fontSize: 12);

  final _headerDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.5, 0.9],
      colors: [Colors.red, Colors.deepOrange.shade300],
    ),
  );
}

class _Profile {
  final String name;
  final String address;
  final String email;
  final String phone;
  final String twitter;
  final String facebook;
  final String image;
  final int followers;
  final int following;

  _Profile({
    this.name,
    this.address,
    this.email,
    this.phone,
    this.twitter,
    this.facebook,
    this.image,
    this.followers,
    this.following,
  });
}
