import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          _content,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _content {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hbox80,
          _header,
          _hbox20,
          _form,
          _termsAndConditions,
          _hbox20,
          _signupButton,
          _hbox20,
          _socialButtons,
        ],
      ),
    );
  }

  Widget get _form {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _createField(
          labelText: 'Email',
          onChanged: (v) => setState(() => email = v),
        ),
        _createField(
          labelText: 'Password',
          onChanged: (v) => setState(() => password = v),
        ),
        _createField(
          labelText: 'Confirm Password',
          onChanged: (v) => setState(() => passwordConfirm = v),
        ),
      ],
    );
  }

  Widget get _signupButton {
    return Align(
      alignment: Alignment.centerRight,
      child: RaisedButton(
        padding: _insetsL40T16R30B16,
        color: Colors.yellow,
        elevation: 0,
        shape: _submitButtonShape,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('SIGN UP', style: _boldS16Style),
            _wbox40,
            _arrowRightIcon,
          ],
        ),
        onPressed: !valid ? null : () => print('Signup'),
      ),
    );
  }

  Widget get _header {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 15,
          child: Container(
            decoration: _headerDecoration,
            width: 70,
            height: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32),
          child: Text("Sign Up", style: _boldS30Style),
        ),
      ],
    );
  }

  Widget get _termsAndConditions {
    return Padding(
      padding: _insetsH32V8,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "By clicking Sign Up you agree to the following "),
            TextSpan(text: "Terms and Conditions", style: _indigoBoldStyle),
            TextSpan(text: " withour reservations."),
          ],
        ),
      ),
    );
  }

  Widget get _socialButtons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton.icon(
          padding: _insetsH30V8,
          shape: _socialShape,
          borderSide: _redBorderSide,
          color: Colors.red,
          highlightedBorderColor: Colors.red,
          textColor: Colors.red,
          icon: _googleIcon,
          label: Text("Google"),
          onPressed: () => print('Sign with Google'),
        ),
        _wbox10,
        OutlineButton.icon(
          padding: _insetsH30V8,
          shape: _socialShape,
          highlightedBorderColor: Colors.indigo,
          borderSide: _indigoBorderSide,
          color: Colors.indigo,
          textColor: Colors.indigo,
          icon: _facebookIcon,
          label: Text("Facebook"),
          onPressed: () => print('Sign with Facebook'),
        ),
      ],
    );
  }

  Widget _createField({String labelText, ValueChanged<String> onChanged}) {
    return Padding(
      padding: _insetsH32V8,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _hbox80 = SizedBox(height: 80);
  final _wbox10 = SizedBox(width: 10);
  final _wbox40 = SizedBox(width: 40);

  final _insetsH32V8 = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
  final _insetsH30V8 = EdgeInsets.symmetric(horizontal: 30, vertical: 8);
  final _insetsL40T16R30B16 = EdgeInsets.fromLTRB(40, 16, 30, 16);

  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final _boldS30Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  final _indigoBoldStyle = TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold);

  final _arrowRightIcon = Icon(FontAwesomeIcons.arrowRight, size: 18);
  final _googleIcon = Icon(FontAwesomeIcons.googlePlusG, size: 18);
  final _facebookIcon = Icon(FontAwesomeIcons.facebookF, size: 18);

  final _submitButtonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
  );

  final _redBorderSide = BorderSide(color: Colors.red);
  final _indigoBorderSide = BorderSide(color: Colors.indigo);
  final _socialShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  final _headerDecoration = BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20));
}
