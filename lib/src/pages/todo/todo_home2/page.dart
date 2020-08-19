import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '_header_footer_widget.dart';

class TodoHomeTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/todo/todo_home2/page.dart";

  final DateTime date;

  TodoHomeTwoPage({DateTime date})
      : this.date = date ?? DateTime.now(),
        super();

  String get month => DateFormat.MMM().format(date).toUpperCase();
  String get day => DateFormat.d().format(date);
  String get dayOfWeek => DateFormat.EEEE().format(date).toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: HeaderFooterwidget(
        header: _header,
        body: SingleChildScrollView(
          padding: _insets32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTask(color: Colors.pink.shade300),
              _hbox20,
              _buildTaskTwo(),
              _hbox20,
              _buildTask(color: Colors.indigo.shade300),
              _hbox20,
              _buildTaskTwo(),
            ],
          ),
        ),
        footer: _footer,
      ),
    );
  }

  Widget get _header {
    return Row(
      children: [
        Padding(
          padding: _insetsV10,
          child: MaterialButton(
            minWidth: 0,
            elevation: 0,
            highlightElevation: 0,
            textColor: Colors.pink,
            padding: _insetsH8V16,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(_radius20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(month),
                _hbox5,
                Text(day, style: _dayStyle),
              ],
            ),
            onPressed: () {},
          ),
        ),
        _wbox20,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dayOfWeek, textAlign: TextAlign.center, style: _dayOfWeekStyle),
            Text('TODAY', style: _todayStyle),
          ],
        ),
      ],
    );
  }

  Widget get _footer {
    return Container(
      padding: _insetsH16V8,
      child: Row(
        children: [
          _wbox5,
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "jot down your task",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
          IconButton(
            color: Colors.white70,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTwo() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: _radius20,
          bottomLeft: _radius20,
          bottomRight: _radius20,
        ),
        color: Colors.white70,
      ),
      padding: _insetsH32V16,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("10:30 - 11:30AM", style: _timeRangeStyle.copyWith(color: Colors.pink)),
          _hbox5,
          Text("Meeting With", style: _meetingWithStyle.copyWith(color: Colors.pink)),
          Text("John Doe"),
          _hbox5,
          Divider(color: Colors.pink),
        ],
      ),
    );
  }

  Widget _buildTask({Color color = Colors.indigo}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: _radius20,
          bottomLeft: _radius20,
          bottomRight: _radius20,
        ),
        color: color,
      ),
      padding: _insetsH32V16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("10:30 - 11:30AM", style: _timeRangeStyle.copyWith(color: Colors.white)),
          _hbox5,
          Text("Meeting With", style: _meetingWithStyle.copyWith(color: Colors.white)),
          Text("John Doe")
        ],
      ),
    );
  }

  // Private Resources
  final _hbox5 = SizedBox(height: 5);
  final _hbox20 = SizedBox(height: 20);
  final _wbox5 = SizedBox(width: 5);
  final _wbox20 = SizedBox(width: 20);

  final _todayStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2);
  final _dayStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final _dayOfWeekStyle = TextStyle(color: Colors.white, letterSpacing: 2);
  final _timeRangeStyle = TextStyle(letterSpacing: 2.5);
  final _meetingWithStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final _insets32 = EdgeInsets.all(32);
  final _insetsV10 = EdgeInsets.symmetric(vertical: 10);
  final _insetsH8V16 = EdgeInsets.symmetric(horizontal: 8, vertical: 16);
  final _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  final _insetsH32V16 = EdgeInsets.symmetric(horizontal: 32, vertical: 16);

  final _radius20 = Radius.circular(20);
}

// ----------------------------------------------------------------------------------
// Private Static Data --------------------------------------------------------------
// ----------------------------------------------------------------------------------
