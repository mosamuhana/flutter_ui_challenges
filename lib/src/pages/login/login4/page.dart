import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class Login4Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/login4/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              padding: _insets20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(LOGIN_BACK),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: _insets20,
              color: Colors.black.withOpacity(0.7),
            ),
            _form,
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

  Widget get _form {
    return SingleChildScrollView(
      padding: _insets20,
      physics: _bouncingScrollPhysics,
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _hbox100,
            Text("Welcome Back", style: _whiteS28Style),
            Text("Sign in to continue", style: _whiteS16Style),
            _hbox30,
            TextField(
              style: _whiteStyle,
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: _white70Style,
                enabledBorder: _underlineInputBorder,
              ),
            ),
            _hbox10,
            TextField(
              obscureText: true,
              style: _whiteStyle,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: _white70Style,
                enabledBorder: _underlineInputBorder,
              ),
            ),
            _hbox20,
            GestureDetector(
              onTap: () {},
              child: Text("Forgot your password?", style: _whiteStyle),
            ),
            _hbox20,
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('SIGN IN'),
                onPressed: () {},
              ),
            ),
            _hbox20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account?", style: _whiteS16Style),
                _wbox10,
                GestureDetector(
                  onTap: () {},
                  child: Text("SIGN UP", style: _whiteS16Style),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
  final _hbox100 = SizedBox(height: 100);
  final _wbox10 = SizedBox(width: 10);

  final _whiteS28Style = TextStyle(color: Colors.white, fontSize: 28);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _white70Style = TextStyle(color: Colors.white70);
  final _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);

  final _insets20 = EdgeInsets.all(20);

  final _bouncingScrollPhysics = BouncingScrollPhysics();

  final _underlineInputBorder = UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54));
}

const LOGIN_BACK = '$STORE_BASE_URL/img%2Flogin-back.jpg?alt=media';
