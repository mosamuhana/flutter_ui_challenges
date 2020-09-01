import 'package:flutter/material.dart';

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
    return ListView(
      physics: BouncingScrollPhysics(),
      children: List.generate(pages.length, (i) => _buildExpandableMenu(pages[i], context)),
    );
  }

  Widget _buildExpandableMenu(MenuItem page, BuildContext context) {
    return RoundedContainer(
      margin: EdgeInsets.symmetric(horizontal: _isExpanded(page.title) ? 0 : 8, vertical: 4),
      padding: _insets0,
      elevation: 0,
      child: ExpansionTile(
        onExpansionChanged: (value) => setState(() => _expandedData[page.title] = value),
        leading: Icon(page.icon),
        title: Text(page.fullTitle, style: _black87BoldStyle),
        children: List.generate(page.items.length, (i) => _buildSubMenu(page.items[i], context)),
      ),
    );
  }

  Widget _buildSubMenu(SubMenuItem item, BuildContext context) {
    return Padding(
      padding: _insetsL32,
      child: ListTile(
        leading: _arrowRightIcon,
        contentPadding: _insets0,
        dense: false,
        isThreeLine: false,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.code),
              onPressed: () => _openPage(context, item, isPreview: true),
            ),
          ],
        ),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black87),
        ),
        onTap: () => _openPage(context, item),
      ),
    );
  }

  void _openPage(BuildContext context, SubMenuItem item, {bool isPreview = false}) {
    Widget page = item.page;
    if (isPreview) {
      page = DesignPreviewPage(page: item.page, title: item.title, path: item.path);
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  bool _isExpanded(String title) => _expandedData[title] != null && _expandedData[title];

  final _insets0 = EdgeInsets.all(0);
  final _insetsL32 = EdgeInsets.only(left: 32);
  final _black87BoldStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black87);
  final _arrowRightIcon = Icon(Icons.arrow_right, color: Colors.deepOrange);
}
