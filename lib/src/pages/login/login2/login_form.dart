import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../core/constants.dart';

class LoginForm extends StatelessWidget {
  static final String path = "lib/src/pages/login/login2/page.dart";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets20,
      child: Stack(
        children: [
          _backgroundClipPath,
          _form,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person, size: 64),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: _loginShape,
                child: Text("Login", style: _white70Style),
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _form {
    return Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: _insetsH20,
            child: TextField(
              style: _blueStyle,
              decoration: _emailDecoration,
            ),
          ),
          _divider,
          Container(
            padding: _insetsH20,
            child: TextField(
              style: _blueStyle,
              decoration: _passwordDecoration,
            ),
          ),
          _divider,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: _insetsR20,
                child: Text("Forgot Password", style: _black45Style),
              )
            ],
          ),
        ],
      ),
    );
  }

  final _white70Style = TextStyle(color: Colors.white70);
  final _blueStyle = TextStyle(color: Colors.blue);
  final _black45Style = TextStyle(color: Colors.black45);

  final _insets20 = EdgeInsets.all(20);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
  final _insetsR20 = EdgeInsets.only(right: 20);

  final _emailDecoration = InputDecoration(
    hintText: "Email address",
    hintStyle: TextStyle(color: Colors.blue.shade200),
    border: InputBorder.none,
    icon: Icon(Icons.email, color: Colors.blue),
  );

  final _passwordDecoration = InputDecoration(
    hintText: "Password",
    hintStyle: TextStyle(color: Colors.blue.shade200),
    border: InputBorder.none,
    icon: Icon(Icons.lock, color: Colors.blue),
  );

  final _loginShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));

  final _divider = Container(
    child: Divider(color: Colors.blue.shade400),
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
  );

  final _backgroundClipPath = ClipPath(
    clipper: RoundedDiagonalPathClipper(),
    child: Container(
      height: 330,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(140),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
    ),
  );
}

const ORIGAMI = '$STORE_BASE_URL/img%2Forigami.png?alt=media';
