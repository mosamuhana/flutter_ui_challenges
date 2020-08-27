import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'auth_dialog.dart';
import 'enums.dart';

class Auth3Page extends StatefulWidget {
  static final String path = "lib/src/pages/login/auth3/page.dart";

  @override
  _Auth3PageState createState() => _Auth3PageState();
}

class _Auth3PageState extends State<Auth3Page> {
  bool isFormVisible;
  AuthType type;

  final _backImage = "assets/hotel/room4.jpg";

  @override
  void initState() {
    super.initState();
    isFormVisible = false;
    type = AuthType.login;
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
          children: [
            Container(
              color: Colors.black54,
              child: Column(
                children: [
                  _hboxTb40,
                  Expanded(
                    child: Column(
                      children: [
                        Text("Welcome", style: _whiteW500S30Style),
                        _hbox10,
                        Text(
                          "Welcome to this awesome login app. \n You are awesome",
                          textAlign: TextAlign.center,
                          style: _white70S18Style,
                        ),
                      ],
                    ),
                  ),
                  _hbox10,
                  Row(
                    children: [
                      _wbox10,
                      Expanded(
                        child: RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          elevation: 0,
                          shape: _buttonShape,
                          child: Text("Login"),
                          onPressed: _onLogin,
                        ),
                      ),
                      _wbox10,
                      Expanded(
                        child: RaisedButton(
                          color: Colors.grey.shade700,
                          textColor: Colors.white,
                          elevation: 0,
                          shape: _buttonShape,
                          child: Text("Signup"),
                          onPressed: _onSignup,
                        ),
                      ),
                      _wbox10,
                    ],
                  ),
                  _hbox40,
                  OutlineButton.icon(
                    borderSide: BorderSide(color: Colors.red),
                    color: Colors.red,
                    textColor: Colors.white,
                    shape: _buttonShape,
                    icon: Icon(FontAwesomeIcons.google),
                    label: Text("Continue with Google"),
                    onPressed: () {},
                  ),
                  _hbox20,
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              //child: !formVisible ? null : _buildPopup(),
              child: !isFormVisible
                  ? null
                  : AuthDialog(
                      type: type,
                      onDismiss: () => setState(() => isFormVisible = false),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin() {
    isFormVisible = true;
    type = AuthType.login;
    setState(() {});
  }

  void _onSignup() {
    isFormVisible = true;
    type = AuthType.signup;
    setState(() {});
  }

  final _hboxTb40 = SizedBox(height: kToolbarHeight + 40);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);
  final _wbox10 = SizedBox(width: 10);

  final _white70S18Style = TextStyle(color: Colors.white70, fontSize: 18);
  final _whiteW500S30Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30);

  final _buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}
