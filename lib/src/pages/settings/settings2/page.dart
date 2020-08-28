import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class Settings2Page extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings2/page.dart";

  @override
  _Settings2PageState createState() => _Settings2PageState();
}

class _Settings2PageState extends State<Settings2Page> {
  bool emailNotifications = true;
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
        ),
        child: DefaultTextStyle(
          style: _whiteStyle,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: _insets32,
                child: Column(
                  children: [
                    _hbox60,
                    _profileHeader,
                    _hbox20,
                    _settingItems,
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _profileHeader {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(_avatarImageUrl),
              fit: BoxFit.cover,
            ),
            border: _whiteBorderAll2,
          ),
        ),
        _wbox10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jane Doe", style: _boldS20Style),
              Text("Nepal", style: _greyStyle),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _settingItems {
    return Column(
      children: [
        ListTile(
          title: Text("Languages", style: _whiteBoldStyle),
          subtitle: Text("English US", style: _greyStyle),
          trailing: _keyboardArrowRightIcon,
          onTap: () {},
        ),
        ListTile(
          title: Text("Profile Settings", style: _whiteBoldStyle),
          subtitle: Text("Jane Doe", style: _greyStyle),
          trailing: _keyboardArrowRightIcon,
          onTap: () {},
        ),
        SwitchListTile(
          title: Text("Email Notifications", style: _whiteBoldStyle),
          subtitle: Text(emailNotifications ? 'On' : 'Off', style: _greyStyle),
          value: emailNotifications,
          onChanged: (v) => setState(() => emailNotifications = v),
        ),
        SwitchListTile(
          title: Text("Push Notifications", style: _whiteBoldStyle),
          subtitle: Text(pushNotifications ? 'On' : 'Off', style: _greyStyle),
          value: pushNotifications,
          onChanged: (v) => setState(() => pushNotifications = v),
        ),
        ListTile(
          title: Text("Logout", style: _whiteBoldStyle),
          onTap: () {},
        ),
      ],
    );
  }

  final _avatarImageUrl = '$STORE_BASE_URL/img%2F4.jpg?alt=media';

  final _hbox20 = SizedBox(height: 20);
  final _hbox60 = SizedBox(height: 60);
  final _wbox10 = SizedBox(width: 10);

  final _greyStyle = TextStyle(color: Colors.grey.shade400);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _whiteBoldStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  final _boldS20Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

  final _insets32 = EdgeInsets.all(32);

  final _whiteBorderAll2 = Border.all(color: Colors.white, width: 2);

  final _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade400);
}
