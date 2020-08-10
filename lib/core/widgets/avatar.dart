import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String image;
  final double size;
  final Color borderColor;
  final double borderWidth;

  const Avatar({
    Key key,
    @required this.image,
    @required this.size,
    this.borderColor,
    this.borderWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: _buildAvatar(context),
    );
  }

  CircleAvatar _buildAvatar(BuildContext context) {
    final borderWidth = (this.borderWidth ?? 0).abs();
    final radius = size / 2.0;
    final backgroundImage = NetworkImage(image);

    if (borderWidth <= 0 || radius <= borderWidth) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: backgroundImage,
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: borderColor ?? Theme.of(context).primaryColor,
      child: CircleAvatar(
        radius: radius - borderWidth,
        backgroundImage: backgroundImage,
      ),
    );
  }
}
