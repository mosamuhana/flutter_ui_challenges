import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/constants.dart';
import 'play_item.dart';
import 'play_list_item.dart';

class MusicPlayerTwoPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/musicplayer_two/page.dart";

  @override
  _MusicPlayerTwoPageState createState() => _MusicPlayerTwoPageState();
}

class _MusicPlayerTwoPageState extends State<MusicPlayerTwoPage> {
  final title = 'My Playlist, 348 Songs';
  int _playIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Music Player', style: _blackStyle),
        actions: [
          MaterialButton(
            padding: _insets0,
            elevation: 0,
            shape: CircleBorder(),
            onPressed: () {},
            child: CircleAvatar(
              maxRadius: 15,
              backgroundImage: NetworkImage(_avatarImage),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: _images.length,
                itemBuilder: (_, i) => _buildImageItem(i),
              ),
            ),
            _hbox10,
            Container(
              width: double.infinity,
              padding: _insets16,
              color: Colors.black,
              child: Text(title.toUpperCase(), style: _whiteStyle),
            ),
            for (var i = 0; i < _items.length; i++) PlayListItem(item: _items[i], playing: _playIndex == i),
          ],
        ),
      ),
    );
  }

  Widget _buildImageItem(int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: _circularBorder10,
            image: DecorationImage(
              image: NetworkImage(_images[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: _imageTextDecoration,
          child: Text("Travel Series", style: _whiteBoldS24Style),
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _blackStyle = TextStyle(color: Colors.black);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _whiteBoldS24Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);

  final _insets0 = EdgeInsets.all(0);
  final _insets16 = EdgeInsets.all(16);

  final _circularBorder10 = BorderRadius.circular(10);

  final _imageTextDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.blue.withOpacity(0.5),
  );
}

const _avatarImage = '$STORE_BASE_URL/img%2F1.jpg?alt=media';

const List<String> _images = [
  '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  '$STORE_BASE_URL/img%2F3.jpg?alt=media',
];

final _items = <PlayItem>[
  PlayItem(artist: 'Ariana Grande', title: 'Daydreaming', time: '3:45'),
  PlayItem(artist: 'Beyonce', title: 'Halo', time: '3:05'),
  PlayItem(artist: 'Just the way you are', title: 'Bruno Mars', time: '3:05'),
  PlayItem(artist: 'Beyonce', title: 'Halo', time: '3:05'),
  PlayItem(artist: 'Just the way you are', title: 'Bruno Mars', time: '3:05'),
];
