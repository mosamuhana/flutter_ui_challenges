import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/text_styles.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

class CheckoutOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/cart1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Choose your plan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            hSizedBox20,
            Row(
              children: <Widget>[
                Expanded(
                  child: RoundedContainer(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text("Free", style: boldTextStyle),
                        hSizedBox5,
                        Text(
                          "7 days",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RoundedContainer(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "\$450",
                          style: boldTextStyle,
                        ),
                        hSizedBox5,
                        Text(
                          "Per week",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RoundedContainer(
                    color: Colors.indigo,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "\$900",
                          style: boldTextStyle.copyWith(color: Colors.white),
                        ),
                        hSizedBox5,
                        Text(
                          "Per month",
                          style: TextStyle(color: Colors.white60, fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RoundedContainer(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text("\$2000", style: boldTextStyle),
                        hSizedBox5,
                        Text(
                          "Lifetime",
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            hSizedBox30,
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.paypal, color: Colors.indigo),
                title: Text("Paypal"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.googleWallet, color: Colors.indigo),
                title: Text("Google Pay"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            RoundedContainer(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.applePay, color: Colors.indigo),
                title: Text("Apple Pay"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            hSizedBox20,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: RaisedButton(
                elevation: 0,
                padding: const EdgeInsets.all(24.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Text("Continue"),
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
