import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../core/constants.dart';
//import '../../../core/ui_constants.dart';
import '../../../../core/widgets.dart';

const String _logoImageUrl = '$STORE_BASE_URL/img%2Forigami.png?alt=media';

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);
const _hbox90 = SizedBox(height: 90);

const _arrowBackIcon = Icon(Icons.arrow_back);
const _emailIcon = Icon(Icons.email, color: Colors.blue);
const _passwordIcon = Icon(Icons.lock, color: Colors.blue);

const _fieldPadding = EdgeInsets.symmetric(horizontal: 20);

const _fieldTextStyle = TextStyle(color: Colors.blue);
final _fieldHintTextStyle = TextStyle(color: Colors.blue.shade200);

final _signupShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));
const _signupText = Text("Sign Up", style: TextStyle(color: Colors.white70));

final _backClipper = RoundedDiagonalPathClipper();

const _backDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(40)),
  color: Colors.white,
);

final _divider = Container(
  child: Divider(color: Colors.blue.shade400),
  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
);

final _logo = CircleAvatar(
  child: PNetworkImage(_logoImageUrl),
  maxRadius: 50,
  backgroundColor: Colors.transparent,
);

final _avatar = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    CircleAvatar(
      radius: 40,
      backgroundColor: Colors.blue.shade600,
      child: Icon(Icons.person, size: 64),
    ),
  ],
);

class Signup1Page extends StatefulWidget {
  static final String path = "lib/src/pages/login/signup1/page.dart";

  @override
  _Signup1PageState createState() => _Signup1PageState();
}

class _Signup1PageState extends State<Signup1Page> {
  String email = '';
  String password = '';
  String passwordConfirm = '';

  bool get valid => email.length > 0 && password.length > 0 && password == passwordConfirm;

  @override
  Widget build(BuildContext context) {
    final _backButton = FloatingActionButton(
      mini: true,
      onPressed: () => Navigator.pop(context),
      backgroundColor: Colors.blue,
      child: _arrowBackIcon,
    );

    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: ListView(
          children: <Widget>[
            _hbox30,
            _logo,
            _hbox20,
            _form(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_backButton],
            ),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    final _emailField = TextField(
      onChanged: (v) => setState(() => email = v),
      style: _fieldTextStyle,
      decoration: InputDecoration(
        hintText: "Email address",
        hintStyle: _fieldHintTextStyle,
        border: InputBorder.none,
        icon: _emailIcon,
      ),
    );

    final _passwordField = TextField(
      onChanged: (v) => setState(() => password = v),
      style: _fieldTextStyle,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: _fieldHintTextStyle,
        border: InputBorder.none,
        icon: _passwordIcon,
      ),
    );

    final _confirmPasswordField = TextField(
      onChanged: (v) => setState(() => passwordConfirm = v),
      style: _fieldTextStyle,
      decoration: InputDecoration(
        hintText: "Confirm password",
        hintStyle: _fieldHintTextStyle,
        border: InputBorder.none,
        icon: _passwordIcon,
      ),
    );

    final _signupButton = RaisedButton(
      shape: _signupShape,
      child: _signupText,
      color: Colors.blue,
      onPressed: !valid ? null : _onSignup,
    );

    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: _backClipper,
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10),
              decoration: _backDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _hbox90,
                  Container(
                    padding: _fieldPadding,
                    child: _emailField,
                  ),
                  _divider,
                  Container(
                    padding: _fieldPadding,
                    child: _passwordField,
                  ),
                  _divider,
                  Container(
                    padding: _fieldPadding,
                    child: _confirmPasswordField,
                  ),
                  _divider,
                  _hbox10,
                ],
              ),
            ),
          ),
          _avatar,
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _signupButton,
            ),
          ),
        ],
      ),
    );
  }

  void _onSignup() {
    print('SIGN UP');
  }
}
