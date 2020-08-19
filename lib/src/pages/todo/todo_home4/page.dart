import 'package:flutter/material.dart';

import '_header_widget.dart';

final List<String> _weekDays = ["S", "M", "T", "W", "T", "F", "S"];
final List<int> _dates = [5, 6, 7, 8, 9, 10, 11];

class TodoHome4Page extends StatelessWidget {
  static final String path = "lib/src/pages/todo/todo_home4/page.dart";

  final int selected = 5;

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
        header: Container(
          padding: _insets16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: _insetsL16,
                child: Text(
                  "January".toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2),
                ),
              ),
              Row(
                children: _weekDays.map(_createWeekDay).toList(),
              ),
              Row(
                children: _dates.map(_createDate).toList(),
              ),
              _hbox10,
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: _insets32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTaskWithDate(),
              _hbox20,
              _buildTask(),
              _hbox20,
              _buildTask(),
              _hbox20,
              _buildTaskWithDate(),
              _hbox20,
              _buildTask(),
              _hbox20,
              _buildTask(),
              _hbox20,
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTaskWithDate() {
    return Row(
      children: [
        Text(
          "JAN\n10",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        _wbox20,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.white70,
            ),
            padding: _insetsH32V16,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "10:30 - 11:30AM",
                  style: TextStyle(letterSpacing: 2.5, color: Colors.deepPurple),
                ),
                _hbox5,
                Text(
                  "Meeting With",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple, fontSize: 16),
                ),
                Text("John Doe")
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _buildTask() {
    return Container(
      padding: _insetsL70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "10:30 - 11:30AM",
            style: TextStyle(letterSpacing: 2.5, color: Colors.white),
          ),
          _hbox5,
          Text(
            "Meeting With",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
          Text("John Doe")
        ],
      ),
    );
  }

  Widget _createWeekDay(String weekDay) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _weekDays.indexOf(weekDay) == selected ? Colors.orange.shade100 : Colors.transparent,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: _insetsT20B8,
        child: Text(
          weekDay,
          style: _weekDays.indexOf(weekDay) == selected ? _selectedStyle : _daysStyle,
        ),
      ),
    );
  }

  Widget _createDate(int date) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _dates.indexOf(date) == selected ? Colors.orange.shade100 : Colors.transparent,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        padding: _insetsT8B20,
        child: Text("$date", style: _dates.indexOf(date) == selected ? _selectedStyle : _daysStyle),
      ),
    );
  }

  // private Resources
  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox20 = SizedBox(width: 20);

  final _selectedStyle = TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold);
  final _daysStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800);

  final _insetsT8B20 = EdgeInsets.only(top: 8, bottom: 20);
  final _insetsT20B8 = EdgeInsets.only(top: 20, bottom: 8);
  final _insets16 = EdgeInsets.all(16);
  final _insets32 = EdgeInsets.all(32);
  final _insetsL16 = EdgeInsets.only(left: 16);
  final _insetsL70 = EdgeInsets.only(left: 70);
  final _insetsH32V16 = EdgeInsets.symmetric(horizontal: 32, vertical: 16);
}
