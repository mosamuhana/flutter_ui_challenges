import 'package:flutter/material.dart';

import 'meeting.dart';

class MeetingWidget extends StatelessWidget {
  final Meeting meeting;
  final bool isFirst;

  MeetingWidget({
    Key key,
    this.meeting,
    this.isFirst = false,
  }) : super(key: key);

  String get time => '${meeting.timeFrom} - ${meeting.timeTo}';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isFirst ? _itemDecoration : null,
      padding: isFirst ? _insetsH32V16 : _insetsL70,
      width: isFirst ? double.infinity : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time, style: isFirst ? _deepPurpleStyle : _whiteStyle),
          _hbox5,
          Text('Meeting With', style: isFirst ? _deepPurpleBoldS16Style : _whiteBoldS16Style),
          Text(meeting.meetWith)
        ],
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _itemDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
    ),
    color: Colors.white70,
  );

  final _insetsH32V16 = EdgeInsets.symmetric(horizontal: 32, vertical: 16);
  final _insetsL70 = EdgeInsets.only(left: 70);

  final _deepPurpleStyle = TextStyle(letterSpacing: 2.5, color: Colors.deepPurple);
  final _deepPurpleBoldS16Style = TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 16);
  final _whiteStyle = TextStyle(letterSpacing: 2.5, color: Colors.white);
  final _whiteBoldS16Style = TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);
}
