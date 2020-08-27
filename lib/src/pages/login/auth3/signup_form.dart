import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  SignupForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _insets16,
      decoration: _formDecoration,
      child: ListView(
        shrinkWrap: true,
        padding: _insets16,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter email",
              border: _outlineInputBorder,
            ),
          ),
          _hbox10,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              border: _outlineInputBorder,
            ),
          ),
          _hbox10,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm password",
              border: _outlineInputBorder,
            ),
          ),
          _hbox10,
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            elevation: 0,
            shape: _signupShape,
            child: Text("Signup"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _insets16 = EdgeInsets.all(16);

  final _formDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16));

  final _outlineInputBorder = OutlineInputBorder();

  final _signupShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}
