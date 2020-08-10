import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../enums.dart';
import '../helper.dart';

class SocialIconButton extends StatelessWidget {
  final String name;
  final SocialType type;

  const SocialIconButton({
    Key key,
    this.name,
    @required this.type,
  }) : super(key: key);

  Color get color {
    switch (type) {
      case SocialType.facebook:
        return Colors.indigo;
      case SocialType.github:
        return Colors.black;
      case SocialType.youtube:
        return Colors.red;
    }
    return Colors.black;
  }

  IconData get icon {
    switch (type) {
      case SocialType.facebook:
        return FontAwesomeIcons.facebookF;
      case SocialType.github:
        return FontAwesomeIcons.github;
      case SocialType.youtube:
        return FontAwesomeIcons.youtube;
    }
    return null;
  }

  String get url {
    if (name == null) return null;
    switch (type) {
      case SocialType.facebook:
        return 'https://facebook.com/$name';
      case SocialType.github:
        return 'https://github.com/$name';
      case SocialType.youtube:
        return 'https://youtube.com/c/$name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: Icon(icon),
      onPressed: url == null ? null : _onPressed,
    );
  }

  void _onPressed() async {
    final launched = await tryLaunchUrl(url);
    if (!launched) {
      throw 'Could not launch $url';
    }
  }
}
