import 'package:flutter/material.dart';

import '../../../../core/helper.dart';
import '../../../../core/widgets.dart';
import 'models.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  VideoCard(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      padding: _insets8,
      margin: _insetsH12V16,
      decoration: _decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: ClipRRect(
              borderRadius: _circularBorder8,
              child: Stack(
                children: [
                  PNetworkImage(
                    video.thumbnail,
                    width: 175,
                    height: 175,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Material(
                      color: Colors.black87,
                      type: MaterialType.circle,
                      child: InkWell(
                        onTap: () => tryLaunchUrl(video.url),
                        child: Padding(
                          padding: _insets8,
                          child: _playArrowIcon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: _insetsL4T16R4,
              child: Text(video.title, style: _whiteStyle),
            ),
          ),
        ],
      ),
    );
  }

  final _insets8 = EdgeInsets.all(8);
  final _insetsH12V16 = EdgeInsets.symmetric(horizontal: 12, vertical: 16);
  final _insetsL4T16R4 = EdgeInsets.only(top: 16, left: 4, right: 4);

  final _whiteStyle = TextStyle(color: Colors.white.withOpacity(0.85));

  final _playArrowIcon = Icon(Icons.play_arrow, color: Colors.white);

  final _circularBorder8 = BorderRadius.circular(8);

  final _decoration = BoxDecoration(
    color: Colors.white.withOpacity(0.2),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(spreadRadius: 2, blurRadius: 10, color: Colors.black26),
    ],
  );
}
