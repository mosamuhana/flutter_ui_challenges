import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class Onboarding4Page extends StatelessWidget {
  static final String path = "lib/src/pages/onboarding/onboarding4.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _brightYellow,
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: FlareActor(
              'assets/flare/bus.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'driving',
            ),
          ),
          Flexible(
            flex: 2,
            child: RaisedButton(
              color: _darkYellow,
              elevation: 4,
              shape: _buttonShape,
              child: Text(
                'Tap here to proceed',
                style: _black54Style,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  final _black54Style = TextStyle(color: Colors.black54);

  final _buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(50));
}

const _brightYellow = Color(0xFFFFD300);
const _darkYellow = Color(0xFFFFB900);
