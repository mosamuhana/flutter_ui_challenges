import 'package:flutter/material.dart';

import 'bool_list_tile.dart';

class FormElementsPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/form_elements/page.dart";

  @override
  _FormElementsPageState createState() => _FormElementsPageState();
}

class _FormElementsPageState extends State<FormElementsPage> {
  bool downloadOverWifi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Elements')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BoolListTile(
              title: "Download over wifi",
              value: downloadOverWifi,
              onChanged: (value) => setState(() => downloadOverWifi = value),
            ),
            _divider,
            BoolListTile(
              title: "Download over wifi",
              value: false,
              onChanged: (value) {},
            ),
            _divider,
            BoolListTile(
              title: "Download over wifi",
              value: true,
              onChanged: (value) {},
            ),
            _divider,
          ],
        ),
      ),
    );
  }

  final _divider = Divider();
}
