import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final void Function(String, String) onSubmit;

  SignUp({Key key, this.onSubmit});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String phone = '';

  bool get valid => email.isNotEmpty && phone.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets16,
      child: Column(
        children: [
          TextField(
            onChanged: (v) => setState(() => email = v),
            decoration: InputDecoration(
              border: _outlineInputBorder,
              contentPadding: _insets16,
              hintText: "enter your email",
            ),
          ),
          _hbox16,
          TextField(
            onChanged: (v) => setState(() => phone = v),
            decoration: InputDecoration(
              border: _outlineInputBorder,
              contentPadding: _insets16,
              prefixStyle: _blackBoldStyle,
              prefixText: "+977 ",
              hintText: "phone",
            ),
          ),
          _hbox16,
          Container(
            width: double.infinity,
            padding: _insetsH32,
            child: RaisedButton(
              elevation: 0,
              highlightElevation: 0,
              textColor: Colors.white,
              color: Colors.pink,
              onPressed: !valid ? null : () => widget.onSubmit?.call(email, phone),
              child: Text("Sign up"),
            ),
          ),
          _hbox10,
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _hbox16 = SizedBox(height: 16);

  final _blackBoldStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  final _insets16 = EdgeInsets.all(16);

  final _insetsH32 = EdgeInsets.symmetric(horizontal: 32);

  final _outlineInputBorder = OutlineInputBorder();
}
