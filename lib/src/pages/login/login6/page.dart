import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login6Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/login6/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            _hbox20,
            _header,
            _hbox20,
            _form,
            _hbox20,
            _signinButton,
            _hbox100,
            _socialButtons,
          ],
        ),
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
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 70,
            height: 20,
          ),
        ),
        Padding(
          padding: _insetsL32,
          child: Text("Sign In", style: _boldS30Style),
        ),
      ],
    );
  }

  Widget get _form {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: _insetsH32V8,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Email",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        Padding(
          padding: _insetsH32V8,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        _hbox10,
        Container(
          padding: EdgeInsets.only(right: 32),
          alignment: Alignment.centerRight,
          child: Text("Forgot your password?"),
        ),
      ],
    );
  }

  Widget get _signinButton {
    return Align(
      alignment: Alignment.centerRight,
      child: RaisedButton(
        padding: _insetsL40T16R30B16,
        color: Colors.yellow,
        elevation: 0,
        shape: _signinShape,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('SIGN IN', style: _boldS16Style),
            _wbox40,
            _arrowRightIcon,
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget get _socialButtons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton.icon(
          padding: _insetsH30V8,
          shape: _socialButtonShape,
          borderSide: BorderSide(color: Colors.red),
          color: Colors.red,
          highlightedBorderColor: Colors.red,
          textColor: Colors.red,
          icon: _googlePlusIcon,
          label: Text("Google"),
          onPressed: () {},
        ),
        _wbox10,
        OutlineButton.icon(
          padding: _insetsH30V8,
          shape: _socialButtonShape,
          highlightedBorderColor: Colors.indigo,
          borderSide: BorderSide(color: Colors.indigo),
          color: Colors.indigo,
          textColor: Colors.indigo,
          icon: _facebookIcon,
          label: Text("Facebook"),
          onPressed: () {},
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox100 = SizedBox(height: 100);
  final _wbox40 = SizedBox(width: 40);
  final _wbox10 = SizedBox(width: 10);

  final _insetsH32V8 = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
  final _insetsH30V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 30);
  final _insetsL40T16R30B16 = EdgeInsets.fromLTRB(40, 16, 30, 16);
  final _insetsL32 = EdgeInsets.only(left: 32);

  final _socialButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  final _signinShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
    ),
  );

  final _arrowRightIcon = Icon(FontAwesomeIcons.arrowRight, size: 18);
  final _googlePlusIcon = Icon(FontAwesomeIcons.googlePlusG, size: 18);
  final _facebookIcon = Icon(FontAwesomeIcons.facebookF, size: 18);

  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final _boldS30Style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
}
