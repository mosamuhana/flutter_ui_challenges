import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'header_widget.dart';
import 'week_widget.dart';
import 'meeting_widget.dart';
import 'models.dart';
import 'data.dart';

class TodoHome4Page extends StatefulWidget {
  static final String path = 'lib/src/pages/todo/todo_home4/page.dart';

  @override
  _TodoHome4PageState createState() => _TodoHome4PageState();
}

class _TodoHome4PageState extends State<TodoHome4Page> {
  DateTime selectedDate;

  String get month => DateFormat('MMM').format(selectedDate).toUpperCase();
  String get day => DateFormat('dd').format(selectedDate);

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('My Week'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: HeaderWidget(
        header: WeekWidget(
          date: DateTime.now(),
          onDaySelect: (day) {
            print('Selected day: ${day.toString()}');
            selectedDate = day;
            setState(() {});
          },
        ),
        //header: WeekWidget(date: DateTime(2020, 8, 1)),
        body: SingleChildScrollView(
          padding: _insets32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildMeetings(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMeetings() {
    final List<Meeting> meetings = getMeetings(selectedDate);
    final list = <Widget>[];

    for (var i = 0; i < meetings.length; i++) {
      var meeting = meetings[i];
      var isFirst = i == 0;
      Widget item = MeetingWidget(meeting: meeting, isFirst: isFirst);
      if (isFirst) {
        list.add(Row(
          children: [
            Text('${meeting.month}\n${meeting.day}', textAlign: TextAlign.center, style: _whiteBoldStyle),
            _wbox20,
            Expanded(child: item),
          ],
        ));
      } else {
        list.add(item);
      }
      list.add(_hbox20);
    }

    return list;
  }

  final _hbox20 = SizedBox(height: 20);
  final _wbox20 = SizedBox(width: 20);

  final _insets32 = EdgeInsets.all(32);

  final _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5);
}
