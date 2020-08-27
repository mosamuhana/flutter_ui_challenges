import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class Auth2Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/auth2/page.dart";

  final String _backImage = MEAL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(_backImage), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: _insets48,
                padding: _insetsH24V48,
                decoration: _contentDecoration,
                child: _content,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(backgroundColor: Colors.transparent, elevation: 0),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _content {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _restaurantMenuIcon,
          _hbox10,
          Text("Good Food", style: _deepOrangeBoldS24Style),
          _hbox20,
          Text(
            "Nutritionally balanced, easy to cook recipes. Quality fresh local ingredients.",
            textAlign: TextAlign.center,
            style: _s18Style,
          ),
          _hbox30,
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              elevation: 0,
              highlightElevation: 0,
              color: Colors.white,
              shape: _createAccountShape,
              child: Text("Create Account"),
              onPressed: () => print("Create Account"),
            ),
          ),
          _hbox30,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Already have account? "),
                WidgetSpan(
                  child: InkWell(
                    onTap: () => print("Login"),
                    child: Text("Log in", style: _boldStyle),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);

  final _deepOrangeBoldS24Style = TextStyle(color: Colors.deepOrange.shade700, fontSize: 24, fontWeight: FontWeight.bold);
  final _s18Style = TextStyle(fontSize: 18);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);

  final _insets48 = EdgeInsets.all(48);
  final _insetsH24V48 = EdgeInsets.symmetric(horizontal: 24, vertical: 48);
  final _contentDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.8),
    borderRadius: BorderRadius.circular(10),
  );

  final _createAccountShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  final _restaurantMenuIcon = Icon(Icons.restaurant_menu, size: 64, color: Colors.grey.shade800);
}

const MEAL = '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media';
