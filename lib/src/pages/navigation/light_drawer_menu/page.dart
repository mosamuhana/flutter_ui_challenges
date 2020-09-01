import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/oval_right_clipper.dart';

class LightDrawerMenuPage extends StatelessWidget {
  static final String path = "lib/src/pages/navigation/light_drawer_menu/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Ligh Drawer Navigation'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _key.currentState.openDrawer(),
        ),
      ),
      drawer: _MenuDrawer(
        onMenuTap: (menuId) {
          print('Selected Menu Id: $menuId');
        },
      ),
      body: SingleChildScrollView(
        padding: _insets16,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: _circularBorder10),
            ),
            _hbox10,
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Colors.lightGreen, borderRadius: _circularBorder10),
            ),
            _hbox10,
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Colors.pink, borderRadius: _circularBorder10),
            ),
          ],
        ),
      ),
    );
  }

  final _key = GlobalKey<ScaffoldState>();
  final _hbox10 = SizedBox(height: 10);
  final _insets16 = EdgeInsets.all(16);
  final _circularBorder10 = BorderRadius.circular(10);
}

class _MenuDrawer extends StatelessWidget {
  final void Function(String) onMenuTap;

  _MenuDrawer({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Divider(color: _dividerColor);
    final style = TextStyle(color: _activeColor, fontSize: 16);

    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: _insetsL16R40,
          decoration: BoxDecoration(color: _primaryColor, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.power_settings_new, color: _activeColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: _avatarImageDecoration,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(_avatarImage),
                    ),
                  ),
                  _hbox5,
                  Text("erika costell", style: _blackW600S18Style),
                  Text("@erika07", style: style),
                  _hbox30,
                  for (var item in _menuItems) ...[
                    _createMenuItem(item, style),
                    divider,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createMenuItem(_MenuItemData item, TextStyle style) {
    return InkWell(
      onTap: () => onMenuTap?.call(item.id),
      child: Container(
        padding: _insetsV5,
        child: Row(
          children: [
            Icon(item.icon, color: _activeColor),
            _wbox10,
            Text(item.title, style: style),
            _spacer,
            if (item.badge != null)
              Material(
                color: Colors.deepOrange,
                elevation: 5,
                shadowColor: Colors.red,
                borderRadius: _circularBorder5,
                child: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: _menuBadgeDecoration,
                  child: Text(item.badge, style: _whiteBoldS12Style),
                ),
              ),
          ],
        ),
      ),
    );
  }

  final _menuItems = <_MenuItemData>[
    _MenuItemData(id: 'home', title: 'Home', icon: Icons.home),
    _MenuItemData(id: 'my_profile', title: 'My profile', icon: Icons.person_pin),
    _MenuItemData(id: 'messages', title: 'Messages', icon: Icons.message, badge: '10+'),
    _MenuItemData(id: 'notifications', title: 'Notifications', icon: Icons.notifications, badge: '5'),
    _MenuItemData(id: 'settings', title: 'Settings', icon: Icons.settings),
    _MenuItemData(id: 'contact_us', title: 'Contact us', icon: Icons.email),
    _MenuItemData(id: 'help', title: 'Help', icon: Icons.info_outline),
  ];

  final _primaryColor = Colors.white;
  final _activeColor = Colors.grey.shade800;
  final _dividerColor = Colors.grey.shade600;

  final _spacer = Spacer();

  final _hbox5 = SizedBox(height: 5);
  final _hbox30 = SizedBox(height: 30);
  final _wbox10 = SizedBox(width: 10);

  final _insetsV5 = EdgeInsets.symmetric(vertical: 5);
  final _insetsL16R40 = EdgeInsets.only(left: 16, right: 40);

  final _circularBorder5 = BorderRadius.circular(5);

  final _menuBadgeDecoration = BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(5));

  final _blackW600S18Style = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600);
  final _whiteBoldS12Style = TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  final _avatarImageDecoration = BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
  );
}

final _avatarImage = '$STORE_BASE_URL/img%2F1.jpg?alt=media';

class _MenuItemData {
  final String id;
  final String title;
  final IconData icon;
  final String badge;
  _MenuItemData({
    @required this.id,
    @required this.title,
    @required this.icon,
    this.badge,
  });
}
