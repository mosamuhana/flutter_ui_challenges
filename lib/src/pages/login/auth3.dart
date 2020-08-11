import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/ui_constants.dart';

const String _backImage = "assets/hotel/room4.jpg";

enum _AuthType { login, signup }

class AuthThreePage extends StatefulWidget {
  static final String path = "lib/src/pages/login/auth3.dart";

  @override
  _AuthThreePageState createState() => _AuthThreePageState();
}

class _AuthThreePageState extends State<AuthThreePage> {
  bool formVisible;
  _AuthType type;

  @override
  void initState() {
    super.initState();
    formVisible = false;
    type = _AuthType.login;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_backImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black54,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: kToolbarHeight + 40),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.0,
                          ),
                        ),
                        hSizedBox10,
                        Text(
                          "Welcome to this awesome login app. \n You are awesome",
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  hSizedBox10,
                  Row(
                    children: <Widget>[
                      wSizedBox10,
                      Expanded(
                        child: RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: Text("Login"),
                          onPressed: _onLogin,
                        ),
                      ),
                      wSizedBox10,
                      Expanded(
                        child: RaisedButton(
                          color: Colors.grey.shade700,
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: Text("Signup"),
                          onPressed: _onSignup,
                        ),
                      ),
                      wSizedBox10,
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  OutlineButton.icon(
                    borderSide: BorderSide(color: Colors.red),
                    color: Colors.red,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    icon: Icon(FontAwesomeIcons.google),
                    label: Text("Continue with Google"),
                    onPressed: () {},
                  ),
                  hSizedBox20,
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              //child: !formVisible ? null : _buildPopup(),
              child: !formVisible
                  ? null
                  : _AuthDialog(
                      type: type,
                      onDismiss: () => setState(() => formVisible = false),
                    ),
            )
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    setState(() {
      formVisible = true;
      type = _AuthType.login;
    });
  }

  void _onSignup() {
    setState(() {
      formVisible = true;
      type = _AuthType.signup;
    });
  }
}

class _AuthDialog extends StatefulWidget {
  final _AuthType type;
  final VoidCallback onDismiss;

  _AuthDialog({
    Key key,
    @required this.type,
    @required this.onDismiss,
  }) : super(key: key);

  @override
  __AuthDialogState createState() => __AuthDialogState();
}

class __AuthDialogState extends State<_AuthDialog> {
  _AuthType type = _AuthType.login;

  bool get isLogin => type == _AuthType.login;
  bool get isSignup => type == _AuthType.signup;

  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                textColor: isLogin ? Colors.white : Colors.black,
                color: isLogin ? Colors.red : Colors.white,
                child: Text("Login"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => setState(() => type = _AuthType.login),
              ),
              wSizedBox10,
              RaisedButton(
                textColor: isSignup ? Colors.white : Colors.black,
                color: isSignup ? Colors.red : Colors.white,
                child: Text("Signup"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => setState(() => type = _AuthType.signup),
              ),
              wSizedBox10,
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.clear),
                onPressed: widget.onDismiss,
              )
            ],
          ),
          Container(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: isLogin ? _LoginForm() : _SignupForm(),
            ),
          )
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter email",
              border: OutlineInputBorder(),
            ),
          ),
          hSizedBox10,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              border: OutlineInputBorder(),
            ),
          ),
          hSizedBox10,
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Login"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Enter email",
              border: OutlineInputBorder(),
            ),
          ),
          hSizedBox10,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              border: OutlineInputBorder(),
            ),
          ),
          hSizedBox10,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm password",
              border: OutlineInputBorder(),
            ),
          ),
          hSizedBox10,
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text("Signup"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
