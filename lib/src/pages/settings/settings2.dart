import 'package:flutter/material.dart';

import '../../../core/constants.dart';

const _avatarImageUrl = '$STORE_BASE_URL/img%2F4.jpg?alt=media';

const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);
const _wbox10 = SizedBox(width: 10);

// ignore: non_constant_identifier_names
final _grey_style = TextStyle(color: Colors.grey.shade400);
const _white_style = TextStyle(color: Colors.white);
const _white_bold_style = TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
const _name_style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
// ignore: non_constant_identifier_names
final _country_style = TextStyle(color: Colors.grey.shade400);

const _padding_all_32 = EdgeInsets.all(32);
// ignore: non_constant_identifier_names
final _white_border2 = Border.all(color: Colors.white, width: 2);

// ignore: non_constant_identifier_names
final keyboard_arrow_right_icon = Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade400);

class SettingsTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings2.dart";

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
          style: _white_style,
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: _padding_all_32,
      child: Column(
        children: <Widget>[
          _hbox30,
          _profileRow,
          _hbox20,
          _languagesItem,
          _profileSettingsItem,
          _emailNotificationsItem,
          _pushNotificationsItem,
          _logoutItem,
        ],
      ),
    );
  }

  Widget get _profileRow {
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
            border: _white_border2,
          ),
        ),
        _wbox10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jane Doe", style: _name_style),
              Text("Nepal", style: _country_style),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _languagesItem {
    return ListTile(
      title: Text("Languages", style: _white_bold_style),
      subtitle: Text("English US", style: _grey_style),
      trailing: keyboard_arrow_right_icon,
      onTap: () {},
    );
  }

  Widget get _profileSettingsItem {
    return ListTile(
      title: Text("Profile Settings", style: _white_bold_style),
      subtitle: Text("Jane Doe", style: _grey_style),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade400),
      onTap: () {},
    );
  }

  Widget get _emailNotificationsItem {
    return SwitchListTile(
      title: Text("Email Notifications", style: _white_bold_style),
      subtitle: Text("On", style: _grey_style),
      value: true,
      onChanged: (v) {},
    );
  }

  Widget get _pushNotificationsItem {
    return SwitchListTile(
      title: Text("Push Notifications", style: _white_bold_style),
      subtitle: Text("Off", style: _grey_style),
      value: false,
      onChanged: (v) {},
    );
  }

  Widget get _logoutItem {
    return ListTile(
      title: Text("Logout", style: _white_bold_style),
      onTap: () {},
    );
  }
}
