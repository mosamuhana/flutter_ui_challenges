import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';
import 'signup1.dart';

const String _logoImageUrl = '$STORE_BASE_URL/img%2Forigami.png?alt=media';

class LoginTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/login/login2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: ListView(
          children: <Widget>[
            hSizedBox30,
            _logo(),
            hSizedBox30,
            _loginForm(),
            _signupButton(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
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
                  _emailField(),
                  _divider(),
                  _passwordField(),
                  _divider(),
                  _forgotPassword(),
                  hSizedBox10,
                ],
              ),
            ),
          ),
          _avatar(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      child: Divider(color: Colors.blue.shade400),
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
    );
  }

  Widget _logo() {
    return CircleAvatar(
      child: PNetworkImage(_logoImageUrl),
      maxRadius: 50,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _signupButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignupOnePage())),
          child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 18.0)),
        )
      ],
    );
  }

  Widget _emailField() {
    return Container(
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
  }

  Widget _passwordField() {
    return Container(
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
  }

  Widget _forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 20.0),
          child: Text("Forgot Password", style: TextStyle(color: Colors.black45)),
        )
      ],
    );
  }

  Widget _avatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blue.shade600,
          child: Icon(Icons.person, size: 64),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return Container(
      height: 420,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Text("Login", style: TextStyle(color: Colors.white70)),
          color: Colors.blue,
          onPressed: () {},
        ),
      ),
    );
  }
}
