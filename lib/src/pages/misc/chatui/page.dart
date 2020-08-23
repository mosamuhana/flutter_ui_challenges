import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'friend.dart';
import 'online_person_action.dart';

class ChatUiPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/chatui/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF363846),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _insetsL20T40R20B20,
            child: Text('Chats', style: _whiteBoldS26Style),
          ),
          _topList,
          Padding(
            padding: _insetsL20T0R20B0,
            child: Text('Newsfeed', style: _whiteS18Style),
          ),
          Padding(
            padding: _insetsL20T10R20B10,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your friends...',
                hintStyle: _white54Style,
                filled: true,
                fillColor: Color(0xFF414350),
                suffixIcon: Icon(Icons.search, color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: _insetsH20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _friends.map((x) => createTile(x)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createTile(Friend friend) {
    return Container(
      decoration: _tileDecoration,
      child: Padding(
        padding: _insetsV10,
        child: Row(
          children: [
            Padding(
              padding: _insetsL0T6R16B6,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(image: NetworkImage(friend.image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(friend.name, style: _whiteS18Style),
                      _wbox6,
                      Text(friend.msgTime, style: _white30Style),
                    ],
                  ),
                  _hbox10,
                  Text(friend.message, style: _white70S16Style),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: _callButtonDecoration,
                  child: IconButton(
                    color: Color(0xFF5791FB),
                    icon: Icon(Icons.call),
                    onPressed: () {},
                  ),
                ),
                _wbox10,
                Container(
                  width: 42,
                  height: 42,
                  decoration: _videoButtonDecoration,
                  child: IconButton(
                    color: Color(0xFF5791FB),
                    icon: Icon(Icons.videocam),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _topList {
    return Padding(
      padding: _insets20,
      child: Container(
        decoration: _topListDecoration,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: _insets8,
            child: Row(
              children: _friends.map((x) => OnlinePersonAction(image: x.image, color: x.color)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox10 = SizedBox(width: 10);
  final _wbox6 = SizedBox(width: 6);

  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);
  final _whiteBoldS26Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26);
  final _white54Style = TextStyle(color: Colors.white54);
  final _white30Style = TextStyle(color: Colors.white30);
  final _white70S16Style = TextStyle(color: Colors.white70, fontSize: 16);

  final _insetsL20T40R20B20 = EdgeInsets.fromLTRB(20, 40, 20, 20);
  final _insetsL20T0R20B0 = EdgeInsets.fromLTRB(20, 0, 20, 0);
  final _insetsL20T10R20B10 = EdgeInsets.fromLTRB(20, 10, 20, 10);
  final _insets8 = EdgeInsets.all(8);
  final _insets20 = EdgeInsets.all(20);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
  final _insetsV10 = EdgeInsets.symmetric(vertical: 10);
  final _insetsL0T6R16B6 = EdgeInsets.fromLTRB(0, 6, 16, 6);

  final _topListDecoration = BoxDecoration(
    color: Color(0xFF414350),
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(color: Colors.black54, offset: Offset(0, 1.5), blurRadius: 1, spreadRadius: -1),
    ],
  );

  final _tileDecoration = BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF565973), width: 1)));
  final _callButtonDecoration = BoxDecoration(color: Color(0xFF414350), borderRadius: BorderRadius.circular(50));
  final _videoButtonDecoration = BoxDecoration(color: Color(0xFF414350), borderRadius: BorderRadius.circular(50));
}

final List<Friend> _friends = [
  Friend(
    name: 'John',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.greenAccent,
  ),
  Friend(
    name: 'RIna',
    image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.yellowAccent,
  ),
  Friend(
    name: 'Brad',
    image: '$STORE_BASE_URL/img%2F6.jpg?alt=media',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.redAccent,
  ),
  Friend(
    name: 'Don',
    image: '$STORE_BASE_URL/img%2F7.jpg?alt=media',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.yellowAccent,
  ),
  Friend(
    name: 'Dev',
    image: '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.greenAccent,
  ),
  Friend(
    name: 'Mukambo',
    image: '$STORE_BASE_URL/img%2Fdev_sudip.jpg?alt=media',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.blueAccent,
  ),
  Friend(
    name: 'Sid',
    image: '$STORE_BASE_URL/img%2Fdev_sid.png?alt=media',
    message: 'Hello, how are you?',
    msgTime: '1 hr.',
    color: Colors.cyanAccent,
  ),
];
