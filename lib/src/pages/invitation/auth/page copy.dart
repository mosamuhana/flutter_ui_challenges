import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'signin.dart';
import 'signup.dart';

class InvitationAuthPage extends StatefulWidget {
  static final String path = "lib/src/pages/invitation/auth/page.dart";

  @override
  _InvitationAuthPageState createState() => _InvitationAuthPageState();
}

class _InvitationAuthPageState extends State<InvitationAuthPage> {
  bool signupForm = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background,
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

  Widget get _background {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Container(color: Colors.pink),
    );
  }

  Widget get _content {
    return SingleChildScrollView(
      padding: _insets16,
      child: Column(
        children: [
          _hboxTB,
          Container(
            alignment: Alignment.topCenter,
            height: (MediaQuery.of(context).size.height / 2) - 150,
            child: PNetworkImage(INVITE, fit: BoxFit.contain),
          ),
          _hbox10,
          _formContainer,
          _hbox10,
          Text("Or connect with"),
          _hbox10,
          Container(
            width: double.infinity,
            padding: _insetsH16,
            child: OutlineButton.icon(
              padding: _insets16,
              icon: _googleIcon,
              label: Text("Google"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget get _formContainer {
    return Container(
      decoration: _formContainerDecoration,
      child: Column(
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
                  padding: _insets16,
                  child: Text("Sign Up", style: _boldStyle),
                ),
                Padding(
                  padding: _insets8,
                  child: Text("Sign In", style: _boldStyle),
                ),
              ],
              isSelected: [signupForm, !signupForm],
              onPressed: (index) => setState(() => signupForm = index == 0),
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: signupForm ? SignUp() : SignIn(),
          ),
        ],
      ),
    );
  }

  final _hboxTB = SizedBox(height: kToolbarHeight - 16);
  final _hbox10 = SizedBox(height: 10);

  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);

  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);
  final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);

  final _googleIcon = Icon(FontAwesomeIcons.google, color: Colors.red);

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
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  );
}

const INVITE = "$STORE_BASE_URL/img%2Finvite.png?alt=media";
