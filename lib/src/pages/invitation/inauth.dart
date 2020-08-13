import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';

import '../../../core/widgets.dart';

class InvitationAuthPage extends StatefulWidget {
  static final String path = "lib/src/pages/invitation/inauth.dart";

  @override
  _InvitationAuthPageState createState() => _InvitationAuthPageState();
}

class _InvitationAuthPageState extends State<InvitationAuthPage> {
  bool signupForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _back,
          _content,
        ],
      ),
    );
  }

  Widget get _back {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Container(color: Colors.pink),
    );
  }

  Widget get _content {
    return SingleChildScrollView(
      padding: _insetsAll16,
      child: Column(
        children: [
          _hboxTop,
          _image,
          _hbox20,
          Container(
            decoration: _formContainerDecoration,
            child: _formContainer,
          ),
          _hbox20,
          Text("Or connect with"),
          _hbox10,
          _googleButton,
        ],
      ),
    );
  }

  Widget get _image {
    return Container(
      alignment: Alignment.topCenter,
      height: (MediaQuery.of(context).size.height / 2) - 150,
      child: PNetworkImage(_logoImageUrl, fit: BoxFit.contain),
    );
  }

  Widget get _formContainer {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: _formContainerTopbarDecoration,
          child: ToggleButtons(
            renderBorder: false,
            selectedColor: Colors.pink,
            fillColor: Colors.transparent,
            children: [
              Padding(
                padding: _insetsAll16,
                child: Text("Sign Up", style: _boldStyle),
              ),
              Padding(
                padding: _insetsAll8,
                child: Text("Sign In", style: _boldStyle),
              ),
            ],
            isSelected: [signupForm, !signupForm],
            onPressed: (index) => setState(() => signupForm = index == 0),
          ),
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: signupForm ? _SignUp() : _SignIn(),
        ),
      ],
    );
  }

  Widget get _googleButton {
    return Container(
      width: double.infinity,
      padding: _insetsSymmetricH16,
      child: OutlineButton.icon(
        padding: _insetsAll16,
        icon: _googleIcon,
        label: Text("Google"),
        onPressed: () {},
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insetsAll16,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: _outlineInputBorder,
              contentPadding: _insetsAll16,
              hintText: "enter your email",
            ),
          ),
          _hbox16,
          TextField(
            decoration: InputDecoration(
              border: _outlineInputBorder,
              hintText: "phone",
              contentPadding: _insetsAll16,
              prefixText: "+977 ",
              prefixStyle: _blackBoldStyle,
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
              color: Colors.pink,
              onPressed: () {},
              child: Text("Sign up"),
            ),
          ),
          _hbox10,
        ],
      ),
    );
  }
}

class _SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insetsAll16,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: _outlineInputBorder,
              contentPadding: _insetsAll16,
              hintText: "enter your email or phone",
            ),
          ),
          _hbox16,
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: _outlineInputBorder,
              hintText: "password",
              contentPadding: _insetsAll16,
              prefixStyle: _blackBoldStyle,
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
              onPressed: () => Navigator.pushNamed(context, 'home'),
              child: Text("Sign In"),
            ),
          ),
          _hbox10,
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _logoImageUrl = "$STORE_BASE_URL/img%2Finvite.png?alt=media";

const _boldStyle = TextStyle(fontWeight: FontWeight.bold);
final _blackBoldStyle = _boldStyle.copyWith(color: Colors.black);

const _hboxTop = SizedBox(height: kToolbarHeight - 16);
const _hbox10 = SizedBox(height: 10);
const _hbox16 = SizedBox(height: 16);
const _hbox20 = SizedBox(height: 20);

const _circularRadius10 = Radius.circular(10);

const _insetsAll8 = EdgeInsets.all(8);
const _insetsAll16 = EdgeInsets.all(16);
const _insetsSymmetricH16 = EdgeInsets.symmetric(horizontal: 16);
const _insetsSymmetricH32 = EdgeInsets.symmetric(horizontal: 32);

const _googleIcon = Icon(FontAwesomeIcons.google, color: Colors.red);

final _formContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(color: Colors.pink, offset: Offset(5, 5), blurRadius: 10),
  ],
);

final _formContainerTopbarDecoration = BoxDecoration(
  color: Colors.grey.shade100,
  borderRadius: BorderRadius.only(
    topLeft: _circularRadius10,
    topRight: _circularRadius10,
  ),
);

const _outlineInputBorder = OutlineInputBorder();
