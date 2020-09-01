import 'package:flutter/material.dart';

//import '../../../../../../core/ui_constants.dart';
import '../../../res/colors.dart';
import '../../../res/typography.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBg,
      body: Container(
        margin: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0), color: Colors.white),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Full Name", style: smallText),
              _buildTextField(),
              _hbox20,
              Text("Mobile Number", style: smallText),
              _buildTextField(),
              _hbox20,
              Text("Email (Optional)", style: smallText),
              _buildTextField(),
              _hbox20,
              Text("Date Type", style: smallText),
              Row(
                children: <Widget>[
                  Radio(
                    groupValue: "AD",
                    value: "AD",
                    onChanged: (value) {},
                  ),
                  Text("AD"),
                  Spacer(),
                  Radio(
                    groupValue: "AD",
                    value: "BS",
                    onChanged: (value) {},
                  ),
                  Text("BS"),
                  Spacer(),
                ],
              ),
              _hbox10,
              Text("Date of Birth (YYYY-MM-DD)", style: smallText),
              _buildTextField(),
              _hbox20,
              Text("Date Type", style: smallText),
              Row(
                children: <Widget>[
                  Radio(
                    groupValue: "Male",
                    value: "Male",
                    onChanged: (value) {},
                  ),
                  Text("Male"),
                  Spacer(),
                  Radio(
                    groupValue: "Male",
                    value: "Female",
                    onChanged: (value) {},
                  ),
                  Text("Female"),
                  Spacer(),
                  Radio(
                    groupValue: "Male",
                    value: "Other",
                    onChanged: (value) {},
                  ),
                  Text("Other"),
                  Spacer(),
                ],
              ),
              _hbox10,
              Text("Password", style: smallText),
              _buildTextField(obscureText: true),
              _hbox20,
              Text("Confirm Password", style: smallText),
              _buildTextField(obscureText: true),
              _hbox20,
              Text("By signing up you agree to the Terms & Conditions", style: smallText),
              _hbox10,
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("Sign Up".toUpperCase()),
                  onPressed: () {},
                ),
              ),
              _hbox10,
              Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Colors.grey.shade600)),
                  _wbox10,
                  Text("Already have an account?", style: smallText),
                  _wbox10,
                  Expanded(child: Divider(color: Colors.grey.shade600)),
                ],
              ),
              _hbox20,
              GestureDetector(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Login".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, 'login', (Route<dynamic> route) => false),
              ),
              _hbox20,
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextField({bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
    );
  }

  final _hbox10 = SizedBox(height: 10.0);
  final _hbox20 = SizedBox(height: 20.0);
  final _wbox10 = SizedBox(width: 10.0);
}
