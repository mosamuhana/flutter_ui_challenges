import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/constants.dart';
import 'package:flutter_ui_challenges/core/ui_constants.dart';

import '../../../core/helper.dart';
import '../../../core/widgets.dart';

part 'data/profile_data6.dart';

const _shadow = BoxShadow(spreadRadius: 2.0, blurRadius: 10.0, color: Colors.black26);

class Profile6Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile6.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PNetworkImage(_dev.backdropPhoto, fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: _buildContent(context),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 25),
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
        children: <Widget>[
          hSizedBox30,
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      margin: const EdgeInsets.only(top: 32.0, left: 16.0),
      padding: const EdgeInsets.all(3.0),
      child: ClipOval(
        child: PNetworkImage(_dev.avatar),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _dev.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
          Text('\n'),
          Text(
            _dev.location,
            style: TextStyle(color: Colors.white.withOpacity(0.85), fontWeight: FontWeight.w500),
          ),
          Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          Text(
            _dev.biography,
            style: TextStyle(color: Colors.white.withOpacity(0.85), height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(245.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: _dev.videos.length,
          itemBuilder: (BuildContext context, int index) => _VideoCard(_dev.videos[index]),
        ),
      ),
    );
  }
}

class _VideoCard extends StatelessWidget {
  final _Video video;

  _VideoCard(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[_shadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                children: <Widget>[
                  PNetworkImage(video.thumbnail, width: 175.0, height: 175.0, fit: BoxFit.fill),
                  Positioned(
                    bottom: 5.0,
                    right: 5.0,
                    child: Material(
                      color: Colors.black87,
                      type: MaterialType.circle,
                      child: InkWell(
                        onTap: () => tryLaunchUrl(video.url),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.play_arrow, color: Colors.white),
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
              padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
              child: Text(
                video.title,
                style: TextStyle(color: Colors.white.withOpacity(0.85)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
