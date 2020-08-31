import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class InvitationLandingPage extends StatelessWidget {
  static final String path = "lib/src/pages/invitation/landing/page.dart";

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return Scaffold(
      appBar: !canPop ? null : AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          if (!canPop) _toolbarBox,
          Text(
            "Invitations",
            style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "A smarter way to hold "),
                TextSpan(text: "events", style: _primaryStyle),
              ],
            ),
          ),
          _hbox20,
          Expanded(
            child: Container(
              decoration: _backContainerDecoration,
              child: Column(
                children: [
                  Expanded(
                    child: Center(child: PNetworkImage(_inviteImageUrl)),
                  ),
                  _hbox20,
                  _buildAccountButton(context),
                  _buildSignInWithGoogleButton(context),
                  _hbox10,
                  _buildSignInButton(context),
                  _hbox30,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: _insetsH20V8,
      child: RaisedButton(
        highlightElevation: 0,
        elevation: 0,
        child: Text("Create an Account"),
        textColor: Colors.pink,
        color: Colors.white,
        //onPressed: () => Navigator.pushNamed(context, 'auth'),
        onPressed: () => print('Create an Account'),
      ),
    );
  }

  Widget _buildSignInWithGoogleButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: OutlineButton(
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.white),
        child: Text("Sign in with Google"),
        textColor: Colors.white,
        color: Colors.white,
        //onPressed: () => Navigator.pushNamed(context, 'auth'),
        onPressed: () => print('Sign in with Google'),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Already have an account? "),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {},
              child: Text("Sign in", style: _whiteBoldStyle),
            ),
          ),
        ],
      ),
      style: _whiteStyle,
    );
  }

  final _toolbarBox = SizedBox(height: kToolbarHeight);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);

  final _whiteBoldStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _primaryStyle = TextStyle(color: _primaryColor);

  final _backContainerDecoration = BoxDecoration(
    color: Colors.pink,
    borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
  );

  final _insetsH20V8 = EdgeInsets.symmetric(horizontal: 20, vertical: 8);

  final _inviteImageUrl = "$STORE_BASE_URL/img%2Finvite.png?alt=media";
}

const _primaryColor = Color(0xffE20056);
