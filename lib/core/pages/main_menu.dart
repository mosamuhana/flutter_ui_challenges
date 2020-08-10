import 'package:flutter/material.dart';

import '../../src/pages/bike/bike_details.dart';
import '../enums.dart';
import '../models.dart';
import '../routes.dart';
import '../widgets.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Map<String, bool> _expandedData;

  @override
  void initState() {
    super.initState();
    _expandedData = {};
  }

  @override
  Widget build(BuildContext context) {
    final children = pages
        .map(
          (page) => page is MenuItem ? _buildExpandableMenu(page, context) : _buildSubMenuContainer(page, context),
        )
        .toList();

    return ListView(
      physics: BouncingScrollPhysics(),
      children: children,
    );
  }

  Widget _buildExpandableMenu(MenuItem page, BuildContext context) {
    final double hMargin = _isExpanded(page.title) ? 0.0 : 8.0;
    final children = page.items.map((item) => _buildSubMenu(item, context)).toList();

    return RoundedContainer(
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: 4.0),
      padding: const EdgeInsets.all(0),
      elevation: 0,
      child: ExpansionTile(
        onExpansionChanged: (b) => setState(() => _expandedData[page.title] = b),
        leading: Icon(page.icon),
        title: Text(
          page.fullTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        children: children,
      ),
    );
  }

  Widget _buildSubMenuContainer(SubMenuItem page, BuildContext context) {
    return BorderedContainer(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: const EdgeInsets.all(0),
      child: _buildSubMenu(page, context),
    );
  }

  Widget _buildSubMenu(SubMenuItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: ListTile(
        leading: Icon(Icons.arrow_right, color: Colors.deepOrange),
        contentPadding: EdgeInsets.all(0),
        dense: false,
        isThreeLine: false,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.code),
              onPressed: () => _openPage(context, item, OpenMode.CODE),
            ),
          ],
        ),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black87),
        ),
        onTap: () => _openPage(context, item, OpenMode.PREVIEW),
      ),
    );
  }

  void _openPage(BuildContext context, SubMenuItem item, OpenMode mode) {
    Widget page = item.page;
    if (mode == OpenMode.CODE) {
      page = DesignPreviewsPage(page: item.page, title: item.title, path: item.path);
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  bool _isExpanded(String title) => _expandedData[title] != null && _expandedData[title];
}
