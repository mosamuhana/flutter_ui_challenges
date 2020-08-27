import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Login3Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/login3/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _waveBackground,
          ListView(
            children: [
              _form,
              _hbox20,
              _bottom,
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
          )
        ],
      ),
    );
  }

  Widget get _form {
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login", textAlign: TextAlign.center, style: _white70BoldS28Style),
          _usernameField,
          _passwordField,
          _loginButton,
          Text("Forgot your password?", style: _whiteStyle),
        ],
      ),
    );
  }

  Widget get _usernameField {
    return Card(
      margin: _insetsL30R30T20,
      elevation: 11,
      shape: _buttonShape,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: _personIcon,
          suffixIcon: _checkCircleIcon,
          hintText: "Username",
          hintStyle: _black26Style,
          filled: true,
          fillColor: Colors.white,
          border: _outlineInputBorder,
          contentPadding: _insetsH20V16,
        ),
      ),
    );
  }

  Widget get _passwordField {
    return Card(
      margin: _insetsL30R30T20,
      elevation: 11,
      shape: _buttonShape,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: _lockIcon,
          hintText: "Password",
          hintStyle: _black26Style,
          filled: true,
          fillColor: Colors.white,
          border: _outlineInputBorder,
          contentPadding: _insetsH20V16,
        ),
      ),
    );
  }

  Widget get _loginButton {
    return Container(
      width: double.infinity,
      padding: _insets30,
      child: RaisedButton(
        padding: _insetsV16,
        color: Colors.pink,
        onPressed: () {},
        elevation: 11,
        shape: _buttonShape,
        child: Text("Login", style: _white70Style),
      ),
    );
  }

  Widget get _bottom {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("or, connect with"),
          _hbox20,
          Row(
            children: [
              _wbox20,
              Expanded(child: _facebookButton),
              _wbox20,
              Expanded(child: _twitterButton),
              _wbox20,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have an account?"),
              _signupButton,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _facebookButton {
    return RaisedButton(
      child: Text("Facebook"),
      textColor: Colors.white,
      color: Colors.blue,
      shape: _buttonShape,
      onPressed: () {},
    );
  }

  Widget get _twitterButton {
    return RaisedButton(
      child: Text("Twitter"),
      textColor: Colors.white,
      color: Colors.indigo,
      shape: _buttonShape,
      onPressed: () {},
    );
  }

  Widget get _signupButton {
    return FlatButton(
      child: Text("Sign up"),
      textColor: Colors.indigo,
      onPressed: () {},
    );
  }

  Widget get _waveBackground {
    return Container(
      height: 650,
      child: RotatedBox(
        quarterTurns: 2,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [Colors.deepPurple, Colors.deepPurple.shade200],
              [Colors.indigo.shade200, Colors.purple.shade200],
            ],
            durations: [19440, 10800],
            heightPercentages: [0.20, 0.25],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          waveAmplitude: 0,
          size: Size(double.infinity, double.infinity),
        ),
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _wbox20 = SizedBox(width: 20);

  final _white70BoldS28Style = TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 28);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _black26Style = TextStyle(color: Colors.black26);
  final _white70Style = TextStyle(color: Colors.white70);

  final _personIcon = Icon(Icons.person, color: Colors.black26);
  final _checkCircleIcon = Icon(Icons.check_circle, color: Colors.black26);
  final _lockIcon = Icon(Icons.lock, color: Colors.black26);

  final _insetsH20V16 = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  final _insetsL30R30T20 = EdgeInsets.only(left: 30, right: 30, top: 20);
  final _insets30 = EdgeInsets.all(30);
  final _insetsV16 = EdgeInsets.symmetric(vertical: 16);

  final _buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40)));

  final _outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(40)),
  );
}
