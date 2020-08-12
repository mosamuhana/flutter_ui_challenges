import 'package:flutter/material.dart';

import '../../../core/constants.dart';

const _avatarImageUrl = '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6';

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox60 = SizedBox(height: 60);

const _padding_all16 = EdgeInsets.all(16);
const _padding_v4_h0 = EdgeInsets.symmetric(vertical: 4, horizontal: 0);
const _padding_v8_h0 = EdgeInsets.symmetric(vertical: 8, horizontal: 0);

const _exitToAppIcon = Icon(Icons.exit_to_app);

final _hDivider = Container(
  margin: const EdgeInsets.symmetric(horizontal: 8),
  width: double.infinity,
  height: 1,
  color: Colors.grey.shade300,
);

final TextStyle _headerStyle = TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 20);

class SettingsThreePage extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings3.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: _padding_all16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ACCOUNT", style: _headerStyle),
            _hbox10,
            _accountCard,
            _hbox20,
            Text("PUSH NOTIFICATIONS", style: _headerStyle),
            _pushNotificationsCard,
            _logoutCard,
            _hbox60,
          ],
        ),
      ),
    );
  }

  Widget get _accountCard {
    return Card(
      elevation: 0.5,
      margin: _padding_v4_h0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(_avatarImageUrl)),
            title: Text("Damodar Lohani"),
            onTap: () {},
          ),
          _hDivider,
          SwitchListTile(
            activeColor: Colors.purple,
            value: true,
            title: Text("Private Account"),
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }

  Widget get _pushNotificationsCard {
    return Card(
      margin: _padding_v8_h0,
      child: Column(
        children: <Widget>[
          SwitchListTile(
            activeColor: Colors.purple,
            value: true,
            title: Text("Received notification"),
            onChanged: (val) {},
          ),
          _hDivider,
          SwitchListTile(
            activeColor: Colors.purple,
            value: false,
            title: Text("Received newsletter"),
            onChanged: null,
          ),
          _hDivider,
          SwitchListTile(
            activeColor: Colors.purple,
            value: true,
            title: Text("Received Offer Notification"),
            onChanged: (val) {},
          ),
          _hDivider,
          SwitchListTile(
            activeColor: Colors.purple,
            value: true,
            title: Text("Received App Updates"),
            onChanged: null,
          ),
        ],
      ),
    );
  }

  Widget get _logoutCard {
    return Card(
      margin: _padding_v8_h0,
      child: ListTile(
        leading: _exitToAppIcon,
        title: Text("Logout"),
        onTap: () {},
      ),
    );
  }
}
