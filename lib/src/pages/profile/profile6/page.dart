import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'models.dart';
import 'video_card.dart';

class Profile6Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile6/page.dart";

  final developer = Developer(
    firstName: 'Cimple',
    lastName: 'Sid',
    avatar: '$STORE_BASE_URL/img%2Fdev_sid.png?alt=media',
    backdropPhoto: '$STORE_BASE_URL/img%2Fbackdrop.png?alt=media',
    location: 'Mahendranagar, Nepal',
    biography: 'Siddhartha  Joshi is a Flutter dev  '
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.  '
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    videos: <Video>[
      Video(
        title: 'WIFI hacking part 1',
        thumbnail: '$STORE_BASE_URL/img%2Fvideo1_thumb.png?alt=media',
        url: 'https://www.youtube.com/watch?v=06qoTsKYWKE',
      ),
      Video(
        title: 'WIFI hacking part 2',
        thumbnail: '$STORE_BASE_URL/img%2Fvideo2_thumb.png?alt=media',
        url: 'https://www.youtube.com/watch?v=3XG4c5_mGCM',
      ),
      Video(
        title: 'WIFI hacking part 3',
        thumbnail: '$STORE_BASE_URL/img%2Fvideo3_thumb.png?alt=media',
        url: 'https://www.youtube.com/watch?v=C29QstsxWQE',
      ),
      Video(
        title: 'Find facebook users location',
        thumbnail: '$STORE_BASE_URL/img%2Fvideo4_thumb.png?alt=media',
        url: 'https://www.youtube.com/watch?v=J9zhKtL_gH0',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PNetworkImage(developer.backdropPhoto, fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(context),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            child: IconButton(
              icon: _arrowBackIcon,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hbox30,
          _buildAvatar(),
          _buildInfo(),
          _buildVideoList(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: _avatarDecoration,
      margin: _insetsL16T32,
      padding: _insets3,
      child: ClipOval(
        child: PNetworkImage(developer.avatar),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: _insetsL16T16R16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(developer.name, style: _whiteBoldS30Style),
          Text('\n'),
          Text(developer.location, style: _whiteW500Style),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: _insetsV32,
            width: 225,
            height: 1,
          ),
          Text(developer.biography, style: _whiteStyle),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return Padding(
      padding: _insetsT16,
      child: SizedBox.fromSize(
        size: Size.fromHeight(245),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: _insetsH8,
          itemCount: developer.videos.length,
          itemBuilder: (_, i) => VideoCard(developer.videos[i]),
        ),
      ),
    );
  }

  final _hbox30 = SizedBox(height: 30);

  final _whiteBoldS30Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);
  final _whiteW500Style = TextStyle(color: Colors.white.withOpacity(0.85), fontWeight: FontWeight.w500);
  final _whiteStyle = TextStyle(color: Colors.white.withOpacity(0.85), height: 1.4);

  final _insets3 = EdgeInsets.all(3);
  final _insetsL16T32 = EdgeInsets.only(top: 32, left: 16);
  final _insetsL16T16R16 = EdgeInsets.only(top: 16, left: 16, right: 16);
  final _insetsT16 = EdgeInsets.only(top: 16);
  final _insetsV32 = EdgeInsets.symmetric(vertical: 16);
  final _insetsH8 = EdgeInsets.symmetric(horizontal: 8);

  final _arrowBackIcon = Icon(Icons.arrow_back, size: 25);

  final _avatarDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white30),
  );
}
