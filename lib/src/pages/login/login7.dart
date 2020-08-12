import 'package:flutter/material.dart';

const _hbox20 = SizedBox(height: 20);
const _hbox25 = SizedBox(height: 25);
const _hbox30 = SizedBox(height: 30);
const _hbox40 = SizedBox(height: 40);

const _emailIcon = Icon(Icons.email, color: Colors.red);
const _passwordIcon = Icon(Icons.lock, color: Colors.red);

const _fieldBorderRadius = BorderRadius.all(Radius.circular(30));
const _fieldContentPadding = EdgeInsets.symmetric(horizontal: 25, vertical: 13);
const _fieldPadding = EdgeInsets.symmetric(horizontal: 32);

const _loginButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(100)),
  color: Color(0xffff3a5a),
);

const _forgotPasswordStyle = TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w700);
const _loginButtonStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);
const _signupStyle =
    TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12, decoration: TextDecoration.underline);

final _clip1 = ClipPath(
  clipper: _WaveClipper2(),
  child: Container(
    child: Column(),
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [Color(0x22ff3a5a), Color(0x22fe494d)]),
    ),
  ),
);

final _clip2 = ClipPath(
  clipper: _WaveClipper3(),
  child: Container(
    child: Column(),
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
  ),
);

final _clip3 = ClipPath(
  clipper: _WaveClipper1(),
  child: Container(
    child: Column(
      children: <Widget>[
        _hbox40,
        Icon(Icons.fastfood, color: Colors.white, size: 60),
        _hbox20,
        Text(
          "Taste Me",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
        ),
      ],
    ),
    width: double.infinity,
    height: 300,
    decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xffff3a5a), Color(0xfffe494d)])),
  ),
);

final _background = Stack(
  children: <Widget>[
    _clip1,
    _clip2,
    _clip3,
  ],
);

final _dontHaveAnAccountText = Text(
  "Don't have an Account ? ",
  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
);

class LoginSevenPage extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7.dart";

  @override
  _LoginSevenPageState createState() => _LoginSevenPageState();
}

class _LoginSevenPageState extends State<LoginSevenPage> {
  String email = '';
  String password = '';

  bool get valid => email.length > 0 && password.length > 0;

  @override
  Widget build(BuildContext context) {
    final _emailField = TextField(
      onChanged: (value) => setState(() => email = value),
      cursorColor: Colors.deepOrange,
      decoration: InputDecoration(
        hintText: "Email",
        prefixIcon: Material(
          elevation: 0,
          borderRadius: _fieldBorderRadius,
          child: _emailIcon,
        ),
        border: InputBorder.none,
        contentPadding: _fieldContentPadding,
      ),
    );

    final _passwordField = TextField(
      onChanged: (value) => setState(() => password = value),
      cursorColor: Colors.deepOrange,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Material(
          elevation: 0,
          borderRadius: _fieldBorderRadius,
          child: _passwordIcon,
        ),
        border: InputBorder.none,
        contentPadding: _fieldContentPadding,
      ),
    );

    final _loginButton = FlatButton(
      child: Text(
        "Login",
        style: valid ? _loginButtonStyle : _loginButtonStyle.copyWith(color: Colors.grey),
      ),
      onPressed: !valid ? null : _onLogin,
    );

    final _forgotPasswordButton = FlatButton(
      child: Text(
        "FORGOT PASSWORD ?",
        style: _forgotPasswordStyle,
      ),
      onPressed: _onForgotPassword,
    );

    final _signupButton = FlatButton(
      child: Text(
        "Sign Up ",
        style: _signupStyle,
      ),
      onPressed: _onSignup,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _background,
          _hbox30,
          Padding(
            padding: _fieldPadding,
            child: Material(
              elevation: 2,
              borderRadius: _fieldBorderRadius,
              child: _emailField,
            ),
          ),
          _hbox20,
          Padding(
            padding: _fieldPadding,
            child: Material(
              elevation: 2,
              borderRadius: _fieldBorderRadius,
              child: _passwordField,
            ),
          ),
          _hbox25,
          Padding(
            padding: _fieldPadding,
            child: Container(
              decoration: _loginButtonDecoration,
              child: _loginButton,
            ),
          ),
          _hbox20,
          //Center(child: _forgotPasswordButton),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_forgotPasswordButton],
          ),
          _hbox20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _dontHaveAnAccountText,
              _signupButton,
            ],
          )
        ],
      ),
    );
  }

  void _onLogin() {
    print('Login');
  }

  void _onForgotPassword() {
    print('Forgot Password');
  }

  void _onSignup() {
    print('Signup');
  }
}

class _WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
