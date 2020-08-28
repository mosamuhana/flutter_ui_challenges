import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final void Function(String, String) onSubmit;

  SignIn({Key key, this.onSubmit});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';

  bool get valid => email.isNotEmpty && password.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insetsAll16,
      child: Column(
        children: [
          TextField(
            onChanged: (v) => setState(() => email = v),
            decoration: InputDecoration(
              border: _outlineInputBorder,
              contentPadding: _insetsAll16,
              hintText: "enter your email or phone",
            ),
          ),
          _hbox16,
          TextField(
            onChanged: (v) => setState(() => password = v),
            obscureText: true,
            decoration: InputDecoration(
              border: _outlineInputBorder,
              contentPadding: _insetsAll16,
              prefixStyle: _blackBoldStyle,
              hintText: "password",
            ),
          ),
          _hbox16,
          Container(
            width: double.infinity,
            padding: _insetsSymmetricH32,
            child: RaisedButton(
              elevation: 0,
              highlightElevation: 0,
              textColor: Colors.white,
              child: Text("Sign In"),
              //onPressed: () => Navigator.pushNamed(context, 'home'),
              onPressed: !valid ? null : () => widget.onSubmit?.call(email, password),
            ),
          ),
          _hbox10,
        ],
      ),
    );
  }

  final _blackBoldStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  final _hbox10 = SizedBox(height: 10);

  final _hbox16 = SizedBox(height: 16);

  final _insetsAll16 = EdgeInsets.all(16);

  final _insetsSymmetricH32 = EdgeInsets.symmetric(horizontal: 32);

  final _outlineInputBorder = OutlineInputBorder();
}
