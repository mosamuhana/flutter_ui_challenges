import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';

const String _backgroundImageUrl = '$STORE_BASE_URL/img%2Flogin-back.jpg?alt=media';

class LoginFourPage extends StatelessWidget {
  static final String path = "lib/src/pages/login/login4.dart";

  @override
  Widget build(BuildContext context) {
    final _background = Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(_backgroundImageUrl), fit: BoxFit.cover),
      ),
    );

    final _backgroundOpacity = Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.black.withOpacity(0.7),
    );

    final _usernameField = TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
      ),
    );

    final _passwordField = TextField(
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
      ),
    );

    final _forgotYourPassword = GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot your password?",
        style: TextStyle(color: Colors.white),
      ),
    );

    final _signinButton = RaisedButton(
      child: Text('SIGN IN'),
      onPressed: () {},
    );

    final _signupButton = GestureDetector(
      onTap: () {},
      child: Text("SIGN UP", style: TextStyle(color: Colors.white, fontSize: 16.0)),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            _background,
            _backgroundOpacity,
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 100),
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 28.0)),
                    Text("Sign in to continue", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    hSizedBox30,
                    _usernameField,
                    hSizedBox10,
                    _passwordField,
                    hSizedBox20,
                    _forgotYourPassword,
                    hSizedBox20,
                    SizedBox(
                      width: double.infinity,
                      child: _signinButton,
                    ),
                    hSizedBox20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Dont have an account?", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                        wSizedBox10,
                        _signupButton,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
