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

/*
Future<void> _save(ui.Image cropped) async {
  final status = await Permission.storage.request();
  if (status == PermissionStatus.granted) {
    await _saveScreenShot(cropped);
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('Saved to gallery.')),
    );
  }
}

Future<dynamic> _saveScreenShot(ui.Image img) async {
  var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  var buffer = byteData.buffer.asUint8List();
  final result = await ImageGallerySaver.saveImage(buffer);
  print(result);

  return result;
}
*/
