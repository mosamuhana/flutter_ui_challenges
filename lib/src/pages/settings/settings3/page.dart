import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'models.dart';

class Settings3Page extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings3/page.dart";

  @override
  _Settings3PageState createState() => _Settings3PageState();
}

class _Settings3PageState extends State<Settings3Page> {
  final settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: _insets16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ACCOUNT", style: _greyBoldS20Style),
            _hbox10,
            _accountCard,
            _hbox20,
            Text("PUSH NOTIFICATIONS", style: _greyBoldS20Style),
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
      margin: _insetsH0V4,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(DEV_DAMODAR)),
            title: Text("Damodar Lohani"),
            onTap: () {},
          ),
          _hDivider,
          _createBoolSetting(settings.privateAccount),
        ],
      ),
    );
  }

  Widget get _pushNotificationsCard {
    return Card(
      margin: _insetsH0V8,
      child: Column(
        children: [
          _createBoolSetting(settings.receivedNotification),
          _hDivider,
          _createBoolSetting(settings.receivedNewsletter),
          _hDivider,
          _createBoolSetting(settings.receivedOfferNotification),
          _hDivider,
          _createBoolSetting(settings.receivedAppUpdates),
        ],
      ),
    );
  }

  Widget get _logoutCard {
    return Card(
      margin: _insetsH0V8,
      child: ListTile(
        leading: _exitToAppIcon,
        title: Text("Logout"),
        onTap: () {},
      ),
    );
  }

  Widget _createBoolSetting(BoolSetting setting) {
    return SwitchListTile(
      activeColor: Colors.purple,
      value: setting.value,
      title: Text(setting.title),
      subtitle: Text(setting.value ? 'On' : 'Off'),
      onChanged: !setting.enabled ? null : (v) => setState(() => setting.value = v),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox60 = SizedBox(height: 60);

  final _insets16 = EdgeInsets.all(16);
  final _insetsH0V4 = EdgeInsets.symmetric(vertical: 4, horizontal: 0);
  final _insetsH0V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 0);

  final _exitToAppIcon = Icon(Icons.exit_to_app);

  final _hDivider = Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    width: double.infinity,
    height: 1,
    color: Colors.grey.shade300,
  );

  final _greyBoldS20Style = TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 20);
}

const DEV_DAMODAR = '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6';
