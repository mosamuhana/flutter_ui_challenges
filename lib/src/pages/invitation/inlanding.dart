import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class InvitationLandingPage extends StatelessWidget {
  static final String path = "lib/src/pages/invitation/inlanding.dart";

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return Scaffold(
      appBar: canPop ? _appbar(context) : null,
      body: Column(
        children: [
          if (!canPop) _toolbarBox,
          Text(
            "Invitations",
            style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
          ),
          _descriptionText,
          _hbox20,
          Expanded(
            child: Container(
              decoration: _backContainerDecoration,
              child: Column(
                children: [
                  Expanded(
                    child: Center(child: PNetworkImage(_logoImageUrl)),
                  ),
                  _hbox20,
                  Container(
                    width: double.infinity,
                    padding: _insetsSymmetricH20V8,
                    child: _createAccountButton(context),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: _signInWithGoogleButton(context),
                  ),
                  _hbox10,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Already have an account? "),
                        WidgetSpan(child: _signInButton(context)),
                      ],
                    ),
                    style: _whiteStyle,
                  ),
                  _hbox30,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appbar(BuildContext context) {
    if (!Navigator.of(context).canPop()) return null;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return RaisedButton(
      highlightElevation: 0,
      elevation: 0,
      child: Text("Create an Account"),
      textColor: Colors.pink,
      color: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'auth'),
    );
  }

  Widget _signInWithGoogleButton(BuildContext context) {
    return OutlineButton(
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Text("Sign in with Google"),
      textColor: Colors.white,
      color: Colors.white,
      onPressed: () => Navigator.pushNamed(context, 'auth'),
    );
  }

  Widget _signInButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text("Sign in", style: _whiteBoldStyle),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _logoImageUrl = "$STORE_BASE_URL/img%2Finvite.png?alt=media";

const Color _primaryColor = Color(0xffE20056);

const _toolbarBox = SizedBox(height: kToolbarHeight);
const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);

const TextStyle _whiteBoldStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle _whiteStyle = TextStyle(color: Colors.white);
const TextStyle _primaryStyle = TextStyle(color: _primaryColor);

final _descriptionText = Text.rich(
  TextSpan(
    children: [
      TextSpan(text: "A smarter way to hold "),
      TextSpan(text: "events", style: _primaryStyle),
    ],
  ),
);

final _backContainerDecoration = BoxDecoration(
  color: Colors.pink,
  borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
);

const _insetsSymmetricH20V8 = EdgeInsets.symmetric(horizontal: 20, vertical: 8);
