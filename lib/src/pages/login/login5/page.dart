import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Login5Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/login5/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: _mainDecoration,
            ),
            SingleChildScrollView(
              padding: _insets20,
              child: _content,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _content {
    return Column(
      children: [
        _hbox40,
        CustomImage(LOGO, height: 80),
        _hbox20,
        Text("GOOD IN FOOD", style: _white70BoldS24Style),
        _hbox40,
        TextField(
          decoration: InputDecoration(
            contentPadding: _insets16,
            prefixIcon: _buildPrefixIcon(_personIcon),
            hintText: "enter your email",
            hintStyle: _white54Style,
            border: _outlineInputBorder,
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
          ),
        ),
        _hbox10,
        TextField(
          decoration: InputDecoration(
            contentPadding: _insets16,
            prefixIcon: _buildPrefixIcon(_lockIcon),
            hintText: "enter your password",
            hintStyle: _white54Style,
            border: _outlineInputBorder,
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
          ),
          obscureText: true,
        ),
        _hbox20,
        SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.white,
            textColor: Colors.lightGreen,
            padding: _insets20,
            shape: _loginShape,
            child: Text('LOGIN'),
            onPressed: () {},
          ),
        ),
        _hbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              textColor: Colors.white70,
              child: Text('CREATE ACCOUNT'),
              onPressed: () {},
            ),
            _vSeparator,
            FlatButton(
              textColor: Colors.white70,
              child: Text('FORGOT PASSWORD'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrefixIcon(Icon icon) {
    return Container(
      padding: _insetsV16,
      margin: _insetsR8,
      decoration: _prefixIconDecoration,
      child: icon,
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);

  final _insetsR8 = EdgeInsets.only(right: 8);
  final _insets16 = EdgeInsets.all(16);
  final _insets20 = EdgeInsets.all(20);
  final _insetsV16 = EdgeInsets.symmetric(vertical: 16);

  final _white70BoldS24Style = TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold);
  final _white54Style = TextStyle(color: Colors.white54);

  final _personIcon = Icon(Icons.person, color: Colors.lightGreen);
  final _lockIcon = Icon(Icons.lock, color: Colors.lightGreen);

  final _outlineInputBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none);

  final _mainDecoration = BoxDecoration(gradient: LinearGradient(colors: [Colors.lightGreen, Colors.green]));

  final _loginShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

  final _vSeparator = Container(color: Colors.white54, width: 2, height: 20);

  final _prefixIconDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(10),
    ),
  );
}

const LOGO = '$STORE_BASE_URL/food%2Flogo.png?alt=media';
