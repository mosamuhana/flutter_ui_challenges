import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import '../signup1/page.dart';
import 'login_form.dart';

class Login2Page extends StatelessWidget {
  static final String path = "lib/src/pages/login/login2/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue.shade100,
            child: ListView(
              children: [
                _hbox10,
                CircleAvatar(
                  child: CustomImage(ORIGAMI),
                  maxRadius: 50,
                  backgroundColor: Colors.transparent,
                ),
                LoginForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Signup1Page())),
                      child: Text("Sign Up", style: _blueS18Style),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _blueS18Style = TextStyle(color: Colors.blue, fontSize: 18);
}

const ORIGAMI = '$STORE_BASE_URL/img%2Forigami.png?alt=media';
