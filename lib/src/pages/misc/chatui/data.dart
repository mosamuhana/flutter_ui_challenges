import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import 'models.dart';

List<Friend> getFriends() {
  return [
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
}
