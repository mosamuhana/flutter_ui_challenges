import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'image_popup_dialog.dart';

class ImagePopupPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/image_popup/page.dart";

  final _images = getImages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image popup')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Tap on the image to view the preview"),
          for (var image in _images) ...[
            _hbox10,
            GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (_) => ImagePopupDialog(
                    image: image,
                    onShare: () => _onShare(image),
                  ),
                );
              },
              child: Container(
                height: 100,
                child: CustomImage(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _onShare(String image) {
    print('SHARE $image');
  }

  final _hbox10 = SizedBox(height: 10);
}

List<String> getImages() {
  return [
    '$STORE_BASE_URL/travel%2Fmount_everest.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
    '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  ];
}
