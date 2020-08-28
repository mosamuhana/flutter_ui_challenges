import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../core/constants.dart';

class SignupForm extends StatefulWidget {
  static final String path = "lib/src/pages/login/login2/page.dart";

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String email = '';
  String password = '';
  String passwordConfirm = '';

  bool get valid => email.length > 0 && password.length > 0 && password == passwordConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets20,
      child: Stack(
        children: [
          _backgroundClipPath,
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: _form,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade600,
                child: Icon(Icons.person, size: 64),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                shape: _buttonShape,
                child: Text("Sign Up", style: _white70Style),
                color: Colors.blue,
                onPressed: !valid ? null : () => print('SIGN UP'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _form {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _createField(
          onChanged: (v) => setState(() => email = v),
          hintText: 'Email address',
          icon: _emailIcon,
        ),
        _divider,
        _createField(
          onChanged: (v) => setState(() => password = v),
          hintText: 'Password',
          icon: _lockIcon,
        ),
        _divider,
        _createField(
          onChanged: (v) => setState(() => passwordConfirm = v),
          hintText: 'Confirm Password',
          icon: _lockIcon,
        ),
        _divider,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: _insetsR20,
              child: Text("Forgot Password", style: _black45Style),
            )
          ],
        ),
      ],
    );
  }

  Widget _createField({String hintText, Icon icon, ValueChanged<String> onChanged}) {
    return Container(
      padding: _insetsH20,
      child: TextField(
        onChanged: onChanged,
        style: _blueStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.blue.shade200),
          border: InputBorder.none,
          icon: icon,
        ),
      ),
    );
  }

  final _white70Style = TextStyle(color: Colors.white70);

  final _blueStyle = TextStyle(color: Colors.blue);

  final _black45Style = TextStyle(color: Colors.black45);

  final _insets20 = EdgeInsets.all(20);

  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);

  final _insetsR20 = EdgeInsets.only(right: 20);

  final _buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));

  final _emailIcon = Icon(Icons.email, color: Colors.blue);
  final _lockIcon = Icon(Icons.lock, color: Colors.blue);

  final _divider = Container(
    child: Divider(color: Colors.blue.shade400),
    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
  );

  final _backgroundClipPath = ClipPath(
    clipper: RoundedDiagonalPathClipper(),
    child: Container(
      height: 400,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(140),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
    ),
  );
}

const ORIGAMI = '$STORE_BASE_URL/img%2Forigami.png?alt=media';
