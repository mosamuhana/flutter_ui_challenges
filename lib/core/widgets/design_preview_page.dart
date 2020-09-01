import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import '../github.dart';
import 'code_view.dart';
import 'keep_alive.dart';

class DesignPreviewPage extends StatelessWidget {
  final String title;
  final Widget page;
  final String path;

  DesignPreviewPage({
    Key key,
    @required this.title,
    @required this.page,
    @required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _whiteStyle = TextStyle(color: Colors.white);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.shareSquare),
              tooltip: "Open full preview",
              onPressed: () => Share.share(Github.getFileUrl(path)),
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: ListTile(
                  leading: Icon(Icons.code, color: Colors.white),
                  title: Text('Code', style: _whiteStyle),
                ),
              ),
              Tab(
                child: ListTile(
                  leading: Icon(Icons.phone_android, color: Colors.white),
                  title: Text('Preview', style: _whiteStyle),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AlwaysAlive(child: CodeView(path: path)),
            AlwaysAlive(child: page),
          ],
        ),
      ),
    );
  }
}
