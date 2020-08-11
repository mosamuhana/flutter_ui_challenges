import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _hBox100 = SizedBox(height: 100);
const _hBox30 = SizedBox(height: 30);
const _hBox120 = SizedBox(height: 120);
const _hBox50 = SizedBox(height: 50);
const _wBox40 = SizedBox(width: 40);
const _wBox10 = SizedBox(width: 10);

const _fieldPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
const _socialButtonPadding = EdgeInsets.symmetric(vertical: 8, horizontal: 30);
const _signinPadding = EdgeInsets.fromLTRB(40, 16, 30, 16);

final _socialButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
final _signinShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  ),
);

const _arrowRightIcon = Icon(FontAwesomeIcons.arrowRight, size: 18);
const _googlePlusIcon = Icon(FontAwesomeIcons.googlePlusG, size: 18);
const _facebookIcon = Icon(FontAwesomeIcons.facebookF, size: 18);

const _signinStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

final _title = Stack(
  children: <Widget>[
    Positioned(
      left: 20,
      top: 15,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 70,
        height: 20,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        "Sign In",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  ],
);

class LoginSixPage extends StatelessWidget {
  static final String path = "lib/src/pages/login/login6.dart";

  @override
  Widget build(BuildContext context) {
    final _emailField = TextField(
      decoration: InputDecoration(
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );

    final _passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );

    final _forgotPassword = Container(
      padding: const EdgeInsets.only(right: 16),
      alignment: Alignment.centerRight,
      child: Text("Forgot your password?"),
    );

    final _signinButton = RaisedButton(
      padding: _signinPadding,
      color: Colors.yellow,
      elevation: 0,
      shape: _signinShape,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('SIGN IN', style: _signinStyle),
          _wBox40,
          _arrowRightIcon,
        ],
      ),
      onPressed: () {},
    );

    final _googleButton = OutlineButton.icon(
      padding: _socialButtonPadding,
      shape: _socialButtonShape,
      borderSide: BorderSide(color: Colors.red),
      color: Colors.red,
      highlightedBorderColor: Colors.red,
      textColor: Colors.red,
      icon: _googlePlusIcon,
      label: Text("Google"),
      onPressed: () {},
    );

    final _facebookButton = OutlineButton.icon(
      padding: _socialButtonPadding,
      shape: _socialButtonShape,
      highlightedBorderColor: Colors.indigo,
      borderSide: BorderSide(color: Colors.indigo),
      color: Colors.indigo,
      textColor: Colors.indigo,
      icon: _facebookIcon,
      label: Text("Facebook"),
      onPressed: () {},
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _hBox100,
            _title,
            _hBox30,
            Padding(
              padding: _fieldPadding,
              child: _emailField,
            ),
            Padding(
              padding: _fieldPadding,
              child: _passwordField,
            ),
            _forgotPassword,
            _hBox120,
            Align(
              alignment: Alignment.centerRight,
              child: _signinButton,
            ),
            _hBox50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _googleButton,
                _wBox10,
                _facebookButton,
              ],
            )
          ],
        ),
      ),
    );
  }
}
