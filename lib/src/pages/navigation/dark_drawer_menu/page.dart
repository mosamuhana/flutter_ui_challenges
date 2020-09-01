import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/oval_right_clipper.dart';

class DarkDrawerMenuPage extends StatefulWidget {
  static final String path = "lib/src/pages/navigation/dark_drawer_menu/page.dart";

  @override
  _DarkDrawerMenuPageState createState() => _DarkDrawerMenuPageState();
}

class _DarkDrawerMenuPageState extends State<DarkDrawerMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Dark Drawer Navigation'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: _menuIcon,
          onPressed: () => _key.currentState.openDrawer(),
        ),
      ),
      drawer: _drawer,
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

  Widget get _drawer {
    final divider = Divider(color: _activeColor);
    final style = TextStyle(color: _activeColor, fontSize: 16);

    Widget createMenuItem(IconData icon, String title) {
      return Container(
        padding: _insetsV8,
        child: Row(
          children: [
            Icon(icon, color: _activeColor),
            _wbox10,
            Text(title, style: style),
          ],
        ),
      );
    }

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
                    decoration: _drawerAvatarDecoration,
                    child: CircleAvatar(backgroundImage: NetworkImage(_avatarImage), radius: 40),
                  ),
                  _hbox5,
                  Text("erika costell", style: _whiteS18Style),
                  Text("@erika07", style: TextStyle(color: _activeColor, fontSize: 16)),
                  _hbox30,
                  createMenuItem(Icons.home, "Home"),
                  divider,
                  createMenuItem(Icons.person_pin, "Your profile"),
                  divider,
                  createMenuItem(Icons.settings, "Settings"),
                  divider,
                  createMenuItem(Icons.email, "Contact us"),
                  divider,
                  createMenuItem(Icons.info_outline, "Help"),
                  divider,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final _key = GlobalKey<ScaffoldState>();
  final _primaryColor = Color(0xff291747);
  final _activeColor = Color(0xff6C48AB);

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox30 = SizedBox(height: 30);
  final _wbox10 = SizedBox(width: 10);

  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);

  final _insets16 = EdgeInsets.all(16);
  final _insetsV8 = EdgeInsets.symmetric(vertical: 8);
  final _insetsL16R40 = EdgeInsets.only(left: 16, right: 40);

  final _circularBorder10 = BorderRadius.circular(10);

  final _menuIcon = Icon(Icons.menu);

  final _drawerAvatarDecoration = BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Colors.pink, Colors.deepPurple]),
  );
}

final _avatarImage = '$STORE_BASE_URL/img%2F1.jpg?alt=media';
