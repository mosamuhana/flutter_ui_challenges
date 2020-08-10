import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'core/ui_constants.dart';
import 'core/text_styles.dart';
import 'core/res/assets.dart';
import 'core/res/text_styles.dart';
import 'core/helper.dart';
import 'core/widgets.dart';

final TextStyle _buttonTextStyle = boldTextStyle.copyWith(fontSize: 16.0);

class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> with SingleTickerProviderStateMixin {
  bool dialogShowing;
  bool showNewUiDialog;
  AnimationController _animationController;
  // RemoteConfig remoteConfig;
  // List<Announcement> announcements;
  // SurveyItem survey;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    dialogShowing = false;
    showNewUiDialog = false;

    // announcements = [];
    // _getRemoteConfig();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /*
  _getRemoteConfig() async {
    if (remoteConfig == null) remoteConfig = await RemoteConfig.instance;

    final Map<String, dynamic> defaults = {
      "news": "[]",
      "survey": "",
    };

    await remoteConfig.setDefaults(defaults);
    await remoteConfig.fetch(expiration: const Duration(hours: 12));
    await remoteConfig.activateFetched();
    final String value = remoteConfig.getString('news');
    final String surval = remoteConfig.getString('survey');

    setState(() {
      announcements = List<Map<String, dynamic>>.from(json.decode(value))
          .map((data) => Announcement.fromMap(data))
          .toList();
      if(surval.isNotEmpty)
      survey = SurveyItem.fromMap(Map<String, dynamic>.from(json.decode(surval)));
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<User>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context: context),
      body: ListView(
        children: <Widget>[
          RoundedContainer(
            borderRadius: BorderRadius.circular(10.0),
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            padding: const EdgeInsets.all(0),
            height: 250,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () => Navigator.pushNamed(context, 'challenge_home'),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      child: Image.asset(appFeatureImage, fit: BoxFit.cover),
                    ),
                  ),
                  hSizedBox10,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "UI Challenges",
                        style: buttonText.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      wSizedBox10,
                      Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  hSizedBox10,
                ],
              ),
            ),
          ),
          // if (announcements.length > 0) ...[
          //   AnnouncementSlider(news: announcements),
          //   const SizedBox(height: 16.0),
          // ],
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // CategoryItem(
                //   icon: Icon(
                //     FontAwesomeIcons.user,
                //     color: Colors.indigo,
                //   ),
                //   title: "Profile",
                //   onPressed: () {
                //     (Provider.of<UserRepository>(context).user != null)
                //         ? Navigator.pushNamed(context, "profile")
                //         : Navigator.pushNamed(context, 'auth_home');
                //   },
                // ),
                hSizedBox10,
                CategoryItem(
                  title: "About",
                  icon: Icon(
                    FontAwesomeIcons.infoCircle,
                    color: Colors.red,
                  ),
                  onPressed: () => Navigator.pushNamed(context, 'about'),
                ),
                // if (survey != null &&
                //     user != null &&
                //     !user.surveys.contains(survey?.id)) ...[
                //   const SizedBox(height: 10.0),
                //   SurveyWidget(survey: survey),
                // ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Widget icon;

  CategoryItem({
    Key key,
    this.onPressed,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(title, style: _buttonTextStyle),
      Spacer(),
      Icon(Icons.keyboard_arrow_right),
    ];

    if (icon != null) {
      children.insertAll(0, [icon, wSizedBox10]);
    }

    return MaterialButton(
      highlightElevation: 0,
      elevation: 0,
      padding: const EdgeInsets.all(24.0),
      child: Row(children: children),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: onPressed,
    );
  }
}

class FeaturedCategoryItem extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Widget icon;

  FeaturedCategoryItem({
    Key key,
    this.onPressed,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      colorBrightness: Brightness.dark,
      highlightColor: Theme.of(context).primaryColor,
      highlightElevation: 0,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          if (icon != null) ...[icon, wSizedBox10],
          Text(
            title,
            style: _buttonTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.w300),
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: onPressed,
    );
  }
}
