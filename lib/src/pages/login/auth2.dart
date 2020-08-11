import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';

const String _backImage = '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media';

class AuthTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/login/auth2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(_backImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(48.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.restaurant_menu, size: 64, color: Colors.grey.shade800),
              hSizedBox10,
              Text(
                "Good Food",
                style: TextStyle(color: Colors.deepOrange.shade700, fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              hSizedBox20,
              Text(
                "Nutritionally balanced, easy to cook recipes. Quality fresh local ingredients.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              hSizedBox30,
              _buildCreateAccountButton(),
              hSizedBox30,
              _buildLoginContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginContent() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Already have account? "),
          WidgetSpan(
            child: InkWell(
              onTap: () => print("Login tapped"),
              child: Text("Log in", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        elevation: 0,
        highlightElevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text("Create Account"),
        onPressed: () {},
      ),
    );
  }
}
