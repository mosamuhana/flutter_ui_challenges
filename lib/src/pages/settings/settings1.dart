import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';

const _avatarImageUrl = '$STORE_BASE_URL/img%2F1.jpg?alt=media';

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox60 = SizedBox(height: 60);

const _scrollViewPadding = EdgeInsets.all(16);
const _settingsCardPadding = EdgeInsets.fromLTRB(32, 8, 32, 16);
const _paddingAll0 = EdgeInsets.all(0);

const _powerOffIcon = Icon(FontAwesomeIcons.powerOff, color: Colors.white);
const _moonIcon = Icon(FontAwesomeIcons.moon);
const _editIcon = Icon(Icons.edit, color: Colors.white);
const _lockOutlineIcon = Icon(Icons.lock_outline, color: Colors.purple);
const _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);
const _languageIcon = Icon(FontAwesomeIcons.language, color: Colors.purple);
const locationOnIcon = Icon(Icons.location_on, color: Colors.purple);

final _profileCardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
final _settingsCardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

const _nameTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w500);

final _hDivider = Container(
  margin: const EdgeInsets.symmetric(horizontal: 8),
  width: double.infinity,
  height: 1,
  color: Colors.grey.shade400,
);

final _powerOffButtonBackground = Positioned(
  bottom: -20,
  left: -20,
  child: Container(
    width: 80,
    height: 80,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
  ),
);

final _notificationSettingsText = Text(
  "Notification Settings",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
);

class SettingsOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings1.dart";

  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
  bool _isDark = false;
  bool _receivedNotification = true;
  bool _receivedNewsletter = false;
  bool _receivedOfferNotification = true;
  bool _receivedAppUpdates = true;

  Brightness get brightness => _isDark ? Brightness.dark : Brightness.light;

  Color get iconThemeColor => _isDark ? Colors.white : Colors.black;

  void toggleBrightness() => setState(() => _isDark = !_isDark);

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
          title: Text(
            'Settings',
            style: TextStyle(color: iconThemeColor),
          ),
          actions: <Widget>[
            IconButton(
              icon: _moonIcon,
              onPressed: toggleBrightness,
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: _scrollViewPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _profileCard,
                  _hbox10,
                  _settingsCard,
                  _hbox20,
                  _notificationSettingsText,
                  _receivedNotificationItem,
                  _receivedNewsletterItem,
                  _receivedOfferNotificationItem,
                  _receivedAppUpdatesItem,
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
        _powerOffButtonBackground,
        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: _powerOffIcon,
            onPressed: _onLogout,
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
        onTap: _onEditProfile,
        title: Text("John Doe", style: _nameTextStyle),
        leading: CircleAvatar(backgroundImage: NetworkImage(_avatarImageUrl)),
        trailing: _editIcon,
      ),
    );
  }

  Widget get _settingsCard {
    return Card(
      elevation: 4,
      margin: _settingsCardPadding,
      shape: _settingsCardShape,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: _lockOutlineIcon,
            title: Text("Change Password"),
            trailing: _keyboardArrowRightIcon,
            onTap: () {
              print('Change Password');
            },
          ),
          _hDivider,
          ListTile(
            leading: _languageIcon,
            title: Text("Change Language"),
            trailing: _keyboardArrowRightIcon,
            onTap: () {
              print('Change Language');
            },
          ),
          _hDivider,
          ListTile(
            leading: locationOnIcon,
            title: Text("Change Location"),
            trailing: _keyboardArrowRightIcon,
            onTap: () {
              print('Change Location');
            },
          ),
        ],
      ),
    );
  }

  Widget get _receivedNotificationItem {
    return SwitchListTile(
      activeColor: Colors.purple,
      contentPadding: _paddingAll0,
      value: _receivedNotification,
      title: Text("Received notification"),
      onChanged: (v) => setState(() => _receivedNotification = v),
    );
  }

  Widget get _receivedNewsletterItem {
    return SwitchListTile(
      activeColor: Colors.purple,
      contentPadding: _paddingAll0,
      value: _receivedNewsletter,
      title: Text("Received newsletter"),
      onChanged: (v) => setState(() => _receivedNewsletter = v),
    );
  }

  Widget get _receivedOfferNotificationItem {
    return SwitchListTile(
      activeColor: Colors.purple,
      contentPadding: _paddingAll0,
      value: _receivedOfferNotification,
      title: Text("Received Offer Notification"),
      onChanged: (v) => setState(() => _receivedOfferNotification = v),
    );
  }

  Widget get _receivedAppUpdatesItem {
    return SwitchListTile(
      activeColor: Colors.purple,
      contentPadding: _paddingAll0,
      value: _receivedAppUpdates,
      title: Text("Received App Updates"),
      onChanged: (v) => setState(() => _receivedAppUpdates = v),
    );
  }

  void _onLogout() => print('Logout');

  void _onEditProfile() => print('Edit Profile');
}
