import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';

class Settings1Page extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings1/page.dart";

  @override
  _Settings1PageState createState() => _Settings1PageState();
}

class _Settings1PageState extends State<Settings1Page> {
  bool _isDark = false;
  bool _receivedNotification = true;
  bool _receivedNewsletter = false;
  bool _receivedOfferNotification = true;
  bool _receivedAppUpdates = true;

  Brightness get brightness => _isDark ? Brightness.dark : Brightness.light;

  Color get iconThemeColor => _isDark ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(brightness: brightness),
      child: Scaffold(
        backgroundColor: _isDark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: brightness,
          iconTheme: IconThemeData(color: iconThemeColor),
          backgroundColor: Colors.transparent,
          title: Text('Settings', style: TextStyle(color: iconThemeColor)),
          actions: [
            IconButton(
              icon: _moonIcon,
              onPressed: () => setState(() => _isDark = !_isDark),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: _insets16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _profileCard,
                  _hbox10,
                  _settingsCard,
                  _hbox20,
                  _settingItems,
                  _hbox60,
                ],
              ),
            ),
            _powerOffButton,
          ],
        ),
      ),
    );
  }

  Widget get _powerOffButton {
    return Stack(
      children: [
        Positioned(
          bottom: -20,
          left: -20,
          child: Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: _powerOffButtonDecoration,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: _powerOffIcon,
            onPressed: () => print('Logout'),
          ),
        ),
      ],
    );
  }

  Widget get _profileCard {
    return Card(
      elevation: 8,
      shape: _profileCardShape,
      color: Colors.purple,
      child: ListTile(
        onTap: () => print('Edit Profile'),
        title: Text("John Doe", style: _whiteW500Style),
        leading: CircleAvatar(backgroundImage: NetworkImage(_avatarImageUrl)),
        trailing: _editIcon,
      ),
    );
  }

  Widget get _settingsCard {
    return Card(
      elevation: 4,
      margin: _insetsL32T8R32B16,
      shape: _settingsCardShape,
      child: Column(
        children: [
          ListTile(
            leading: _lockOutlineIcon,
            title: Text("Change Password"),
            trailing: _keyboardArrowRightIcon,
            onTap: () => print('Change Password'),
          ),
          _hDivider,
          ListTile(
            leading: _languageIcon,
            title: Text("Change Language"),
            trailing: _keyboardArrowRightIcon,
            onTap: () => print('Change Language'),
          ),
          _hDivider,
          ListTile(
            leading: locationOnIcon,
            title: Text("Change Location"),
            trailing: _keyboardArrowRightIcon,
            onTap: () => print('Change Location'),
          ),
        ],
      ),
    );
  }

  Widget get _settingItems {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notification Settings", style: _indigoBoldS20Style),
        SwitchListTile(
          activeColor: Colors.purple,
          contentPadding: _insets0,
          value: _receivedNotification,
          title: Text("Received notification"),
          onChanged: (v) => setState(() => _receivedNotification = v),
        ),
        SwitchListTile(
          activeColor: Colors.purple,
          contentPadding: _insets0,
          value: _receivedNewsletter,
          title: Text("Received newsletter"),
          onChanged: (v) => setState(() => _receivedNewsletter = v),
        ),
        SwitchListTile(
          activeColor: Colors.purple,
          contentPadding: _insets0,
          value: _receivedOfferNotification,
          title: Text("Received Offer Notification"),
          onChanged: (v) => setState(() => _receivedOfferNotification = v),
        ),
        SwitchListTile(
          activeColor: Colors.purple,
          contentPadding: _insets0,
          value: _receivedAppUpdates,
          title: Text("Received App Updates"),
          onChanged: (v) => setState(() => _receivedAppUpdates = v),
        ),
      ],
    );
  }

  final _avatarImageUrl = '$STORE_BASE_URL/img%2F1.jpg?alt=media';

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox60 = SizedBox(height: 60);

  final _insets16 = EdgeInsets.all(16);
  final _insetsL32T8R32B16 = EdgeInsets.fromLTRB(32, 8, 32, 16);
  final _insets0 = EdgeInsets.all(0);

  final _powerOffIcon = Icon(FontAwesomeIcons.powerOff, color: Colors.white);
  final _moonIcon = Icon(FontAwesomeIcons.moon);
  final _editIcon = Icon(Icons.edit, color: Colors.white);
  final _lockOutlineIcon = Icon(Icons.lock_outline, color: Colors.purple);
  final _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);
  final _languageIcon = Icon(FontAwesomeIcons.language, color: Colors.purple);
  final locationOnIcon = Icon(Icons.location_on, color: Colors.purple);

  final _profileCardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  final _settingsCardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  final _whiteW500Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  final _indigoBoldS20Style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo);

  final _hDivider = Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    width: double.infinity,
    height: 1,
    color: Colors.grey.shade400,
  );

  final _powerOffButtonDecoration = BoxDecoration(color: Colors.purple, shape: BoxShape.circle);
}
