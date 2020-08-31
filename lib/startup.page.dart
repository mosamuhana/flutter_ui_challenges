import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'core/widgets.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> with SingleTickerProviderStateMixin {
  bool dialogShowing;
  bool showNewUiDialog;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    dialogShowing = false;
    showNewUiDialog = false;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: ListView(
        children: [
          RoundedContainer(
            borderRadius: _circularBorder10,
            margin: _insetsH16V8,
            padding: _insets0,
            height: 250,
            child: InkWell(
              borderRadius: _circularBorder10,
              onTap: () => Navigator.pushNamed(context, 'challenge_home'),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: _circularTopBorder10,
                      child: Image.asset(_appFeatureImage, fit: BoxFit.cover),
                    ),
                  ),
                  _hbox10,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "UI Challenges",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      _wbox10,
                      Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
                    ],
                  ),
                  _hbox10,
                ],
              ),
            ),
          ),
          Padding(
            padding: _insets16,
            child: Column(
              children: [
                _hbox10,
                _buildAboutItem(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutItem(BuildContext context) {
    return MaterialButton(
      highlightElevation: 0,
      elevation: 0,
      padding: _insets24,
      child: Row(
        children: [
          _infoCircleIcon,
          _wbox10,
          Text('About', style: _boldS16Style),
          _spacer,
          _keyboardArrowRightIcon,
        ],
      ),
      color: Colors.white,
      shape: _aboutShape,
      onPressed: () => Navigator.pushNamed(context, 'about'),
    );
  }

  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        height: kToolbarHeight + 20,
        child: ListTile(
          contentPadding: _insets0,
          trailing: Container(
            decoration: _appBarDecoration,
            padding: _insetsL8T30R8B8,
            child: Image.asset(_appLogo, width: 20),
          ),
          title: Padding(
            padding: _insetsL16T35,
          ),
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox10 = SizedBox(width: 10);

  final _insets0 = EdgeInsets.all(0);
  final _insets16 = EdgeInsets.all(16);
  final _insets24 = EdgeInsets.all(24);
  final _insetsH16V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);
  final _insetsL8T30R8B8 = EdgeInsets.fromLTRB(8, 30, 8, 8);
  final _insetsL16T35 = EdgeInsets.only(top: 35, left: 16);

  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final buttonText = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

  final _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);
  final _infoCircleIcon = Icon(FontAwesomeIcons.infoCircle, color: Colors.red);

  final _circularBorder10 = BorderRadius.circular(10);

  final _circularTopBorder10 = BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));

  final _aboutShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  final _spacer = Spacer();

  final _appBarDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
  );

  final _appLogo = 'assets/icon/icon.png';
  final _appFeatureImage = 'assets/icon/feature_store.jpg';
}
