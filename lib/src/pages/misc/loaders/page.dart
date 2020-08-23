import 'package:flutter/material.dart';

import 'loader_one.dart';
import 'loader_two.dart';

class LoadersPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/loaders/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loaders"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoaderOne(color: Colors.red),
            _hbox10,
            LoaderTwo(),
            _hbox10,
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
}
