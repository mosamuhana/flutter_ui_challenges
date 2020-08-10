import 'dart:io';

import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  final Color color;

  const BackIconButton({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}
