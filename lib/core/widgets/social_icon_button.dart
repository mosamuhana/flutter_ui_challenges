import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helper.dart';

enum SocialType { facebook, github, youtube, instagram, twitter }

class SocialIconButton extends StatelessWidget {
  final SocialType type;
  final String name;
  final Color color;
  final VoidCallback onPressed;

  const SocialIconButton({
    Key key,
    @required this.type,
    this.name,
    this.color,
    this.onPressed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return IconButton(
      color: color ?? _color,
      icon: Icon(icon),
      onPressed: url == null ? null : (onPressed != null ? onPressed : _onPressed),
    );
  }

  Color get _color {
    switch (type) {
      case SocialType.facebook:
        return Colors.indigo;
      case SocialType.github:
        return Colors.black;
      case SocialType.youtube:
        return Colors.red;
      case SocialType.instagram:
        return Colors.orange[400];
      case SocialType.twitter:
        return Colors.blue;
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
      case SocialType.instagram:
        return FontAwesomeIcons.instagram;
      case SocialType.twitter:
        return FontAwesomeIcons.twitter;
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
      case SocialType.instagram:
        return 'https://www.instagram.com/$name';
      case SocialType.twitter:
        return 'https://twitter.com/$name';
    }
    return null;
  }

  void _onPressed() async {
    final launched = await tryLaunchUrl(url);
    if (!launched) {
      throw 'Could not launch $url';
    }
  }
}
