import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';

class ImagePopupDialog extends StatelessWidget {
  final String image;
  final VoidCallback onShare;

  ImagePopupDialog({
    Key key,
    @required this.image,
    this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: CustomImage(image, fit: BoxFit.contain),
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
                onPressed: onShare,
              ),
            ],
          ),
        ],
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10);

  final _closeIcon = Icon(Icons.close);
  final _shareIcon = Icon(Icons.share);
}
