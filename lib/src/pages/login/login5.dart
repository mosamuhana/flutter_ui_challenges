import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

const String _logoImageUrl = '$STORE_BASE_URL/food%2Flogo.png?alt=media';

final _logo = Container(
  margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
  height: 80,
  child: PNetworkImage(_logoImageUrl),
);

final _title = Text(
  "GOOD IN FOOD",
  style: TextStyle(color: Colors.white70, fontSize: 24.0, fontWeight: FontWeight.bold),
);

class LoginFivePage extends StatelessWidget {
  static final String path = "lib/src/pages/login/login5.dart";

  @override
  Widget build(BuildContext context) {
    final _emailField = TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Icon(Icons.person, color: Colors.lightGreen),
        ),
        hintText: "enter your email",
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
    );

    final _passwordField = TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Icon(Icons.lock, color: Colors.lightGreen),
        ),
        hintText: "enter your password",
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
      obscureText: true,
    );

    final _loginButton = RaisedButton(
      color: Colors.white,
      textColor: Colors.lightGreen,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text('LOGIN'),
      onPressed: () {},
    );

    final _createAccountButton = FlatButton(
      textColor: Colors.white70,
      child: Text('CREATE ACCOUNT'),
      onPressed: () {},
    );

    final _forgotPasswordButton = FlatButton(
      textColor: Colors.white70,
      child: Text('FORGOT PASSWORD'),
      onPressed: () {},
    );
    final _vSeparator = Container(color: Colors.white54, width: 2.0, height: 20.0);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.lightGreen, Colors.green])),
        child: Column(
          children: <Widget>[
            _logo,
            _title,
            SizedBox(height: 40),
            _emailField,
            hSizedBox10,
            _passwordField,
            hSizedBox30,
            SizedBox(
              width: double.infinity,
              child: _loginButton,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _createAccountButton,
                _vSeparator,
                _forgotPasswordButton,
              ],
            ),
            hSizedBox10,
          ],
        ),
      ),
    );
  }
}
