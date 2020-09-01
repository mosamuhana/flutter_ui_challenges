import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../res/constants.dart';
import '../../../res/typography.dart';

class RecoverPasswordPage extends StatelessWidget {
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
                    Text("Recover Password", style: TextStyle(fontSize: 20.0)),
                    _hbox10,
                    Text("We will send the Confirmation Code through SMS\nPlease type your Mobile number below."),
                    _hbox20,
                    TextField(decoration: InputDecoration(hintText: "Mobile Number")),
                    _hbox20,
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Recover".toUpperCase()),
                        onPressed: () {},
                      ),
                    ),
                    _hbox20,
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(color: Colors.grey.shade600)),
                        _wbox10,
                        Text("Having problems?", style: smallText),
                        _wbox10,
                        Expanded(child: Divider(color: Colors.grey.shade600)),
                      ],
                    ),
                    _hbox20,
                    GestureDetector(
                      child: Text(
                        "Contact Us".toUpperCase(),
                        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
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
  final _hbox10 = SizedBox(height: 10.0);
  final _hbox20 = SizedBox(height: 20.0);
}
