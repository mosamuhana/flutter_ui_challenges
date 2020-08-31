import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CropResultPage extends StatelessWidget {
  final ui.Image image;

  const CropResultPage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Result'),
        centerTitle: true,
      ),
      body: Center(
        child: RawImage(image: image),
      ),
    );
  }
}
