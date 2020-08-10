import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import '../constants.dart';
import 'code_view.dart';
import 'keep_alive.dart';

ListTile _createListTile(String text, IconData icon, Color color) {
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
  );
}

final _tabs = <Widget>[
  Tab(child: _createListTile('Code', Icons.code, Colors.white)),
  Tab(child: _createListTile('Preview', Icons.phone_android, Colors.white)),
];

class DesignPreviewsPage extends StatelessWidget {
  final String title;
  final Widget page;
  final String path;

  const DesignPreviewsPage({
    Key key,
    @required this.title,
    @required this.page,
    @required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.shareSquare),
              tooltip: "Open full preview",
              onPressed: () => Share.share('$githubRepo/blob/master/$path'),
            )
          ],
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AlwaysAliveWidget(child: MyCodeView(filePath: path)),
            AlwaysAliveWidget(child: page),
          ],
        ),
      ),
    );
  }
}
