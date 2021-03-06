import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/constants.dart';
import '../../../res/typography.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBg,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, left: 16.0, right: 16.0, bottom: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0), color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.perm_contact_calendar),
                        _wbox10,
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(hintText: "Mobile or Email"),
                          ),
                        ),
                      ],
                    ),
                    _hbox20,
                    Row(
                      children: <Widget>[
                        Icon(Icons.lock),
                        _wbox10,
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: GestureDetector(
                                  child: Icon(Icons.remove_red_eye),
                                  onTap: () {},
                                )),
                          ),
                        ),
                      ],
                    ),
                    _hbox30,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Login".toUpperCase()),
                        onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
                      ),
                    ),
                    _hbox20,
                    GestureDetector(
                      child: Text(
                        "Forgot Password".toUpperCase(),
                        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'recover');
                      },
                    ),
                    _hbox20,
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(color: Colors.grey.shade600)),
                        _wbox10,
                        Text("Not a member?", style: smallText),
                        _wbox10,
                        Expanded(child: Divider(color: Colors.grey.shade600)),
                      ],
                    ),
                    _hbox20,
                    GestureDetector(
                      child: Text(
                        "Create Account".toUpperCase(),
                        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'register');
                      },
                    ),
                    _hbox20,
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                height: 100,
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                )),
          ],
        ),
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10.0);
  final _hbox20 = SizedBox(height: 20.0);
  final _hbox30 = SizedBox(height: 30.0);
}
