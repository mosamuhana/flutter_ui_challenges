import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

const _base = 'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o';
const String _rocket = '$_base/img%2Frocket.png?alt=media';

class Profile7Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile7.dart";

  final _backHeader = Container(width: double.infinity, height: 330, color: Colors.deepOrange);
  final _avatar = Container(
    height: 90,
    margin: EdgeInsets.only(top: 60),
    child: CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white,
      child: PNetworkImage(_rocket),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final _name = Text(
      "Sudip Thapa",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      textAlign: TextAlign.center,
    );

    final _address = Text(
      "Kathmandu",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
      textAlign: TextAlign.center,
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      floatingActionButton: FloatingActionButton(
        child: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _backHeader,
                Positioned(top: 10, right: 20, child: Icon(Icons.settings, color: Colors.white)),
                Column(
                  children: <Widget>[
                    _avatar,
                    hSizedBox5,
                    _name,
                    hSizedBox5,
                    _address,
                    _buildCounters(),
                    _UserInfo(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounters() {
    return Container(
      margin: EdgeInsets.only(top: 77),
      padding: EdgeInsets.all(10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildCounter('Photos', '150'),
            _buildCounter('Followers', '2,000'),
            _buildCounter('Followings', '5,000'),
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(String name, String value) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 5),
          child: Text(name, style: TextStyle(color: Colors.black54)),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(value, style: TextStyle(color: Colors.black87, fontSize: 16)),
        ),
      ],
    );
  }
}

class _UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(color: Colors.black38),
                  Container(
                    child: Column(
                      children: <Widget>[
                        _buildListTile('Location', 'Kathmandu', Icons.my_location),
                        _buildListTile('Email', 'sudeptech@gmail.com', Icons.email),
                        _buildListTile('Phone', '99--99876-56', Icons.phone),
                        _buildListTile(
                            'About Me', 'This is a about me link and you can khow about me in this section.', Icons.person),
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

  ListTile _buildListTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
