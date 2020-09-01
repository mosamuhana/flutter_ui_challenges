import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'signup_form.dart';

class Signup1Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/signup1/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: Stack(
          children: [
            ListView(
              children: [
                _hbox10,
                CircleAvatar(
                  child: CustomImage(ORIGAMI),
                  maxRadius: 50,
                  backgroundColor: Colors.transparent,
                ),
                SignupForm(),
              ],
            ),
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
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
}
