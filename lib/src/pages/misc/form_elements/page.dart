import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';

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
            PCheckboxListTile(
              title: "Download over wifi",
              value: downloadOverWifi,
              onChanged: (value) => setState(() => downloadOverWifi = value),
            ),
            _divider,
            PCheckboxListTile(
              title: "Download over wifi",
              value: false,
              onChanged: (value) {},
            ),
            _divider,
            PCheckboxListTile(
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
