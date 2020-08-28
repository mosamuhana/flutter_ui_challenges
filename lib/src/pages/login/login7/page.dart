import 'package:flutter/material.dart';

import 'wave_clipper.dart';

class Login7Page extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7/page.dart";

  @override
  _Login7PageState createState() => _Login7PageState();
}

class _Login7PageState extends State<Login7Page> {
  String email = '';
  String password = '';

  bool get valid => email.length > 0 && password.length > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              _background,
              _hbox10,
              _form,
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
    );
  }

  Widget get _form {
    return Container(
      padding: _insetsH32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildField(
            hintText: 'Email',
            onChanged: (value) => setState(() => email = value),
            prefixIcon: _emailIcon,
          ),
          _hbox10,
          _buildField(
            hintText: 'Password',
            onChanged: (value) => setState(() => password = value),
            prefixIcon: _lockIcon,
          ),
          _hbox10,
          Container(
            decoration: _loginButtonDecoration,
            child: FlatButton(
              child: Text("Login", style: valid ? _whiteW700S18Style : _greyW700S18Style),
              onPressed: !valid ? null : () => print('Login'),
            ),
          ),
          _hbox10,
          FlatButton(
            child: Text("FORGOT PASSWORD ?", style: _redW700S12Style),
            onPressed: () => print('Forgot Password'),
          ),
          //_hbox10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an Account ? ", style: _blackS12Style),
              FlatButton(
                child: Text("Sign Up ", style: _redW500S12Style),
                onPressed: () => print('Signup'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _background {
    double height = 270;
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: height,
            decoration: _decoration1,
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: height,
            decoration: _decoration2,
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            child: Column(
              children: [
                _hbox40,
                _fastfoodIcon,
                _hbox20,
                Text("Taste Me", style: _whiteW700S30Style),
              ],
            ),
            width: double.infinity,
            height: height,
            decoration: _decoration3,
          ),
        ),
      ],
    );
  }

  Widget _buildField({String hintText, Icon prefixIcon, ValueChanged<String> onChanged}) {
    return Material(
      elevation: 2,
      borderRadius: _fieldBorderRadius,
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Material(
            elevation: 0,
            borderRadius: _fieldBorderRadius,
            child: prefixIcon,
          ),
          border: InputBorder.none,
          contentPadding: _insetsH25V13,
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);

  final _emailIcon = Icon(Icons.email, color: Colors.red);
  final _lockIcon = Icon(Icons.lock, color: Colors.red);
  final _fastfoodIcon = Icon(Icons.fastfood, color: Colors.white, size: 60);

  final _fieldBorderRadius = BorderRadius.all(Radius.circular(30));
  final _insetsH25V13 = EdgeInsets.symmetric(horizontal: 25, vertical: 13);
  final _insetsH32 = EdgeInsets.symmetric(horizontal: 32);

  final _redW700S12Style = TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w700);
  final _whiteW700S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);
  final _greyW700S18Style = TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18);
  final _redW500S12Style =
      TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12, decoration: TextDecoration.underline);
  final _whiteW700S30Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30);
  final _blackS12Style = TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal);

  final _loginButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(100)),
    color: Color(0xffff3a5a),
  );

  final _decoration1 = BoxDecoration(gradient: LinearGradient(colors: [Color(0x22ff3a5a), Color(0x22fe494d)]));
  final _decoration2 = BoxDecoration(gradient: LinearGradient(colors: [Color(0x44ff3a5a), Color(0x44fe494d)]));
  final _decoration3 = BoxDecoration(gradient: LinearGradient(colors: [Color(0xffff3a5a), Color(0xfffe494d)]));
}
