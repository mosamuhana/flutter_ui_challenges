import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class MenuOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/navigation/menu_one/page.dart";

  final avatarImage = '$STORE_BASE_URL/img%2F1.jpg?alt=media';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Ink(decoration: BoxDecoration(color: _primaryColor)),
          _rect1,
          _rect2,
          _rect3,
          _rect4,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _avatar,
              _hbox10,
              _buildMenuItem(
                title: 'Feed',
                onTap: () {},
              ),
              _buildMenuItem(
                title: 'Activities',
                onTap: () {},
              ),
              _buildMenuItem(
                title: 'Chat',
                onTap: () {},
                suffix: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  foregroundColor: _primaryColor,
                  child: Text("5"),
                ),
              ),
              _buildMenuItem(
                title: 'Help',
                onTap: () {},
              ),
              _buildMenuItem(
                title: 'Settings',
                onTap: () {},
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: _insetsB50,
              child: MaterialButton(
                elevation: 0,
                padding: _insets16,
                shape: CircleBorder(),
                color: Colors.grey.shade800,
                child: Icon(Icons.clear, color: _primaryColor),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _avatar {
    return Center(
      child: Container(
        padding: _insets8,
        height: 100,
        width: 100,
        decoration: _avatarDecoration,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(avatarImage), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({@required String title, VoidCallback onTap, Widget suffix}) {
    var text = Text(title, style: _blackBoldS18Style, textAlign: TextAlign.center);
    Widget child = text;
    if (suffix != null) {
      child = Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            text,
            _wbox5,
            suffix,
          ],
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      splashColor: _primaryColor,
      child: Padding(
        padding: _insets16,
        child: child,
      ),
    );
  }

  // Statics

  final _rect1 = Positioned(
    top: -100,
    left: 100,
    child: Transform.rotate(
      angle: -0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.3),
        ),
        width: 150,
        height: 300,
      ),
    ),
  );

  final _rect2 = Positioned(
    bottom: -120,
    right: 90,
    child: Transform.rotate(
      angle: -0.8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.3),
        ),
        width: 150,
        height: 300,
      ),
    ),
  );

  final _rect3 = Positioned(
    top: -50,
    left: 30,
    child: Transform.rotate(
      angle: -0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.3),
        ),
        width: 150,
        height: 200,
      ),
    ),
  );

  final _rect4 = Positioned(
    bottom: -80,
    right: 0,
    child: Transform.rotate(
      angle: -0.8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.3),
        ),
        width: 150,
        height: 200,
      ),
    ),
  );

  final _primaryColor = Color(0xff4BBEC0);
  final _blackBoldS18Style = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);

  final _wbox5 = SizedBox(width: 5);
  final _hbox10 = SizedBox(height: 10);

  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);
  final _insetsB50 = EdgeInsets.only(bottom: 50);

  final _avatarDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10));
}
