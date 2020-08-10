import 'package:flutter/material.dart';

import '../../../core/widgets.dart';

class FormElementPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/form_elements.dart";
  @override
  _FormElementPageState createState() => _FormElementPageState();
}

class _FormElementPageState extends State<FormElementPage> {
  bool downloadOverWifi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Elements'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PCheckboxListTile(
              title: "Download over wifi",
              value: downloadOverWifi,
              onChanged: (value) {
                setState(() {
                  downloadOverWifi = value;
                });
              },
            ),
            Divider(),
            PCheckboxListTile(
              title: "Download over wifi",
              value: false,
              onChanged: (value) {},
            ),
            Divider(),
            PCheckboxListTile(
              title: "Download over wifi",
              value: true,
              onChanged: (value) {},
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
