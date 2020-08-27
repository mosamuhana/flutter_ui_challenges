import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';

class Auth1Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/auth1/page.dart";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                _loginContent,
                _signupContent,
              ],
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

  Widget get _loginContent {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.pink,
              image: DecorationImage(image: NetworkImage(_backgroundImage), fit: BoxFit.cover),
            ),
            foregroundDecoration: _pinkDecoration,
          ),
          Container(
            padding: _insets16,
            width: double.infinity,
            child: Column(
              children: [
                _spacer2,
                Text("existing members", style: _whiteW500S16Style),
                _hbox10,
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: _buttonShape,
                    padding: _insets16,
                    color: Colors.white,
                    child: Text("Login", style: _pinkStyle),
                    onPressed: () {},
                  ),
                ),
                _spacer
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _signupContent {
    return Expanded(
      child: Container(
        padding: _insets16,
        width: double.infinity,
        decoration: _whiteDecoration,
        child: Column(
          children: [
            _spacer,
            Text("or if you are new here"),
            _hbox10,
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: _buttonShape,
                padding: _insets16,
                color: Colors.pink,
                child: Text("Sign up", style: _whiteStyle),
                onPressed: () {},
              ),
            ),
            _hbox20,
            Text("or continue with"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton.icon(
                  shape: _socialButtonShape,
                  color: Colors.red,
                  icon: _googleIcon,
                  label: Text("Google", style: _whiteStyle),
                  onPressed: () {},
                ),
                _hbox10,
                RaisedButton.icon(
                  shape: _socialButtonShape,
                  color: Colors.indigo,
                  icon: _facebookIcon,
                  label: Text("Facebook", style: _whiteStyle),
                  onPressed: () {},
                ),
              ],
            ),
            _spacer2,
          ],
        ),
      ),
    );
  }

  final _backgroundImage = '$STORE_BASE_URL/img%2Fb3.jpg?alt=media';

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _insets16 = EdgeInsets.all(16);

  final _googleIcon = Icon(FontAwesomeIcons.google, color: Colors.white);
  final _facebookIcon = Icon(FontAwesomeIcons.facebook, color: Colors.white);

  final _whiteW500S16Style = TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white);
  final _pinkStyle = TextStyle(color: Colors.pink);
  final _whiteStyle = TextStyle(color: Colors.white);

  final _pinkDecoration = BoxDecoration(color: Colors.pink.withAlpha(100));
  final _whiteDecoration = BoxDecoration(color: Colors.white);

  final _buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

  final _socialButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(2));

  final _spacer = Spacer();
  final _spacer2 = Spacer(flex: 2);
}
