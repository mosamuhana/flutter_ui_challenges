import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

const String _logoImageUrl = '$STORE_BASE_URL/img%2Forigami.png?alt=media';

final _divider = Container(
  child: Divider(color: Colors.blue.shade400),
  padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
);

final _logo = CircleAvatar(
  child: PNetworkImage(_logoImageUrl),
  maxRadius: 50,
  backgroundColor: Colors.transparent,
);

final _avatar = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    CircleAvatar(
      radius: 40.0,
      backgroundColor: Colors.blue.shade600,
      child: Icon(Icons.person, size: 64),
    ),
  ],
);

class SignupOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/login/signup1.dart";

  @override
  Widget build(BuildContext context) {
    final _backButton = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FloatingActionButton(
          mini: true,
          onPressed: () => Navigator.pop(context),
          backgroundColor: Colors.blue,
          child: Icon(Icons.arrow_back),
        ),
      ],
    );

    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: ListView(
          children: <Widget>[
            hSizedBox30,
            _logo,
            hSizedBox20,
            _form(),
            _backButton,
          ],
        ),
      ),
    );
  }

  Widget _form() {
    final _emailField = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          hintText: "Email address",
          hintStyle: TextStyle(color: Colors.blue.shade200),
          border: InputBorder.none,
          icon: Icon(Icons.email, color: Colors.blue),
        ),
      ),
    );

    final _passwordField = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.blue.shade200),
          border: InputBorder.none,
          icon: Icon(Icons.lock, color: Colors.blue),
        ),
      ),
    );

    final _confirmPasswordField = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
          hintText: "Confirm password",
          hintStyle: TextStyle(color: Colors.blue.shade200),
          border: InputBorder.none,
          icon: Icon(Icons.lock, color: Colors.blue),
        ),
      ),
    );

    final _signupButton = Container(
      height: 420,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Text("Sign Up", style: TextStyle(color: Colors.white70)),
          color: Colors.blue,
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 90.0),
                  _emailField,
                  _divider,
                  _passwordField,
                  _divider,
                  _confirmPasswordField,
                  _divider,
                  hSizedBox10,
                ],
              ),
            ),
          ),
          _avatar,
          _signupButton,
        ],
      ),
    );
  }
}
