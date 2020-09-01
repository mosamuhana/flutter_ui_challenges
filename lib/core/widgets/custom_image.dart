import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;

  const CustomImage(
    this.image, {
    Key key,
    this.fit,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
