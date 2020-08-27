import 'package:flutter/material.dart';

import 'enums.dart';
import 'login_form.dart';
import 'signup_form.dart';

class AuthDialog extends StatefulWidget {
  final AuthType type;
  final VoidCallback onDismiss;

  AuthDialog({
    Key key,
    @required this.type,
    @required this.onDismiss,
  }) : super(key: key);

  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  AuthType type = AuthType.login;

  bool get isLogin => type == AuthType.login;
  bool get isSignup => type == AuthType.signup;

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                textColor: isLogin ? Colors.white : Colors.black,
                color: isLogin ? Colors.red : Colors.white,
                child: Text("Login"),
                shape: _buttonShape,
                onPressed: () => setState(() => type = AuthType.login),
              ),
              _wbox10,
              RaisedButton(
                textColor: isSignup ? Colors.white : Colors.black,
                color: isSignup ? Colors.red : Colors.white,
                child: Text("Signup"),
                shape: _buttonShape,
                onPressed: () => setState(() => type = AuthType.signup),
              ),
              _wbox10,
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
              child: isLogin ? LoginForm() : SignupForm(),
            ),
          )
        ],
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10);

  final _buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}
