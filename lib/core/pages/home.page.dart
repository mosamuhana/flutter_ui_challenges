import 'package:flutter/material.dart';

import 'main_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.indigo,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Ui Challenges', style: _blackStyle),
          elevation: 0,
        ),
        body: MainMenu(),
        //bottomNavigationBar: null,
      ),
    );
  }

  final _blackStyle = TextStyle(color: Colors.black);
}
