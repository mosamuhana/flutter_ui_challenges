import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Login1Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/login1/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: _insets20,
            color: Colors.grey.shade800,
            child: ListView(
              children: [
                _content,
              ],
            ),
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
      ),
    );
  }

  Widget get _content {
    return Column(
      children: [
        _hbox50,
        Container(
          width: 200,
          child: PNetworkImage(ROCKET),
        ),
        _hbox50,
        ListTile(
          title: TextField(
            style: _whiteStyle,
            decoration: _emailDecoration,
          ),
        ),
        _divider,
        ListTile(
          title: TextField(
            style: _whiteStyle,
            decoration: _passwordDecoration,
          ),
        ),
        _divider,
        _hbox20,
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.cyan,
                child: Text('Login', style: _white70S16Style),
              ),
            ),
          ],
        ),
        _hbox40,
        Text(
          'Forgot your password?',
          style: _greyStyle,
        ),
      ],
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);
  final _hbox50 = SizedBox(height: 50);

  final _white70S16Style = TextStyle(color: Colors.white70, fontSize: 16);
  final _greyStyle = TextStyle(color: Colors.grey.shade500);
  final _whiteStyle = TextStyle(color: Colors.white);

  final _insets20 = EdgeInsets.all(20);

  final _divider = Divider(color: Colors.grey.shade600);

  final _emailDecoration = InputDecoration(
    hintText: "Email address:",
    hintStyle: TextStyle(color: Colors.white70),
    border: InputBorder.none,
    icon: Icon(Icons.email, color: Colors.white30),
  );

  final _passwordDecoration = InputDecoration(
    hintText: "Password:",
    hintStyle: TextStyle(color: Colors.white70),
    border: InputBorder.none,
    icon: Icon(Icons.lock, color: Colors.white30),
  );
}

const ROCKET = '$STORE_BASE_URL/img%2Frocket.png?alt=media';
