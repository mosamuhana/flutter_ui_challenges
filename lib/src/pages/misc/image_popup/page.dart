import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class ImagePopupPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/image_popup/page.dart";

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
            _buildImage(context, image),
          ],
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String image) {
    return GestureDetector(
      onTap: () => _showImageDialog(context, image),
      child: Container(
        height: 100,
        child: PNetworkImage(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: PNetworkImage(image, fit: BoxFit.contain),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: _closeIcon,
                  onPressed: () => Navigator.pop(context),
                ),
                _wbox10,
                IconButton(
                  color: Colors.white,
                  icon: _shareIcon,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox10 = SizedBox(width: 10);

  final _closeIcon = Icon(Icons.close);
  final _shareIcon = Icon(Icons.share);
}

const _images = <String>[
  '$STORE_BASE_URL/travel%2Fmount_everest.jpg?alt=media',
  '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
  '$STORE_BASE_URL/img%2F4.jpg?alt=media',
];
