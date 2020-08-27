import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _hbox30 = SizedBox(height: 30);
const _hbox60 = SizedBox(height: 60);
const _hbox50 = SizedBox(height: 50);
const _hbox80 = SizedBox(height: 80);
const _wbox10 = SizedBox(width: 10);
const _wbox40 = SizedBox(width: 40);

const _fieldPadding = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
const _signupPadding = EdgeInsets.fromLTRB(40, 16, 30, 16);

const _signupTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

const _arrowRightIcon = Icon(FontAwesomeIcons.arrowRight, size: 18);
const _googleIcon = Icon(FontAwesomeIcons.googlePlusG, size: 18);
const _facebookIcon = Icon(FontAwesomeIcons.facebookF, size: 18);

const _signupShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  ),
);

const _socialPadding = EdgeInsets.symmetric(vertical: 8, horizontal: 30);
const _socialBorderSide = BorderSide(color: Colors.red);
final _socialShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

final _header = Stack(
  children: <Widget>[
    Positioned(
      left: 20,
      top: 15,
      child: Container(
        decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        width: 70,
        height: 20,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        "Sign Up",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  ],
);

final _termsAndConditions = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  child: Text.rich(
    TextSpan(
      children: [
        TextSpan(text: "By clicking Sign Up you agree to the following "),
        TextSpan(
          text: "Terms and Conditions",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        TextSpan(text: " withour reservations."),
      ],
    ),
  ),
);

class Signup2Page extends StatefulWidget {
  static final String path = "lib/src/pages/login/signup2/page.dart";

  @override
  _Signup2PageState createState() => _Signup2PageState();
}

class _Signup2PageState extends State<Signup2Page> {
  String email = '';
  String password = '';
  String passwordConfirm = '';

  bool get valid => email.isNotEmpty && password.isNotEmpty && password == passwordConfirm;

  @override
  Widget build(BuildContext context) {
    final _emailField = TextField(
      onChanged: (v) => setState(() => email = v),
      decoration: InputDecoration(
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );

    final _passwordField = TextField(
      onChanged: (v) => setState(() => password = v),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );

    final _passwordConfirmField = TextField(
      onChanged: (v) => setState(() => passwordConfirm = v),
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm password",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );

    final _signupButton = RaisedButton(
      padding: _signupPadding,
      color: Colors.yellow,
      elevation: 0,
      shape: _signupShape,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('SIGN UP', style: _signupTextStyle),
          _wbox40,
          _arrowRightIcon,
        ],
      ),
      onPressed: !valid ? null : _onSignup,
    );

    final _googleButton = OutlineButton.icon(
      padding: _socialPadding,
      shape: _socialShape,
      borderSide: _socialBorderSide,
      color: Colors.red,
      highlightedBorderColor: Colors.red,
      textColor: Colors.red,
      icon: _googleIcon,
      label: Text("Google"),
      onPressed: () => print('Sign with Google'),
    );

    final _facebookButton = OutlineButton.icon(
      padding: _socialPadding,
      shape: _socialShape,
      highlightedBorderColor: Colors.indigo,
      borderSide: BorderSide(color: Colors.indigo),
      color: Colors.indigo,
      textColor: Colors.indigo,
      icon: _facebookIcon,
      label: Text("Facebook"),
      onPressed: () => print('Sign with Facebook'),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _hbox80,
            _header,
            _hbox30,
            Padding(
              padding: _fieldPadding,
              child: _emailField,
            ),
            Padding(
              padding: _fieldPadding,
              child: _passwordField,
            ),
            Padding(
              padding: _fieldPadding,
              child: _passwordConfirmField,
            ),
            _termsAndConditions,
            _hbox60,
            Align(
              alignment: Alignment.centerRight,
              child: _signupButton,
            ),
            _hbox50,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _googleButton,
                _wbox10,
                _facebookButton,
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSignup() {
    print('Signup');
  }
}
