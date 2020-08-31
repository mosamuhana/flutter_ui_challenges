import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models.dart';
import 'data.dart';

class TodoHome1Page extends StatefulWidget {
  static final String path = "lib/src/pages/todo/todo_home1/page.dart";

  @override
  _TodoHome1PageState createState() => _TodoHome1PageState();
}

class _TodoHome1PageState extends State<TodoHome1Page> {
  List<Task> _tasks;
  ScrollController _controller;
  int _index = 0;

  int get completed => _tasks.where((x) => x.completed).length;
  int get uncompleted => _tasks.where((x) => !x.completed).length;

  @override
  void initState() {
    _tasks = getTasks();
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingActionButton,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header,
                _hbox40,
                _tasksHeader,
                _hbox30,
                ..._taskList,
                _hbox30,
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: 50,
        child: Row(
          children: [
            _wbox20,
            IconButton(
              color: Colors.grey.shade700,
              icon: _menuIcon,
              onPressed: () => print('Menu'),
            ),
            _spacer,
            IconButton(
              color: Colors.grey.shade700,
              icon: _calendarAltIcon,
              onPressed: () => print('Calendar'),
            ),
            _wbox20,
          ],
        ),
      ),
    );
  }

  Widget get _floatingActionButton {
    return FloatingActionButton(
      backgroundColor: _color2,
      child: _addIcon,
      onPressed: _onAdd,
    );
  }

  Widget get _header {
    return Container(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: -100,
            top: -150,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [_color1, _color2]),
                boxShadow: [_headerShadow1],
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [_color3, _color2]),
              boxShadow: [_headerShadow2],
            ),
          ),
          Positioned(
            top: 100,
            right: 200,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [_color3, _color2]),
                boxShadow: [_headerShadow2],
              ),
            ),
          ),
          Container(
            margin: _insetsL30T60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Himanshu", style: _whiteW700S28Style),
                _hbox10,
                Text("You have $uncompleted remaining\ntasks for today!", style: _whiteS18Style),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _tasksHeader {
    return Container(
      height: 50,
      padding: _insetsL20,
      child: OverflowBox(
        maxWidth: 500,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text("Today", style: _blackBoldS45Style),
            _wbox100,
            Text("Tomorrow", style: _greyBoldS45Style),
          ],
        ),
      ),
    );
  }

  List<Widget> get _taskList {
    final list = <Widget>[];
    for (var i = 0; i < _tasks.length; i++) list.add(_createTask(i));
    return list;
  }

  Widget _createTask(int index) {
    final task = _tasks[index];
    return Padding(
      //key: index == _tasks.length - 1 ? dataKey : null,
      padding: _insetsL10,
      child: ListTile(
        title: Text(
          task.title,
          style: task.completed ? _completedStyle : _uncompletedStyle,
        ),
        onTap: () {
          task.completed = !task.completed;
          setState(() {});
        },
      ),
    );
  }

  void _onAdd() async {
    final task = Task(title: 'New Task ${++_index}');
    _tasks.add(task);
    setState(() {});
  }

  Future<void> _scrollToEnd() {
    final offset = _controller.position.maxScrollExtent + 60;
    return _controller.animateTo(offset, duration: _durationMs250, curve: Curves.ease);
  }

  final _headerShadow1 = BoxShadow(color: _color2, offset: Offset(4, 4), blurRadius: 10);
  final _headerShadow2 = BoxShadow(color: _color3, offset: Offset(1, 1), blurRadius: 4);

  final _hbox10 = SizedBox(height: 10);
  final _hbox30 = SizedBox(height: 30);
  final _hbox40 = SizedBox(height: 40);
  final _wbox20 = SizedBox(width: 20);
  final _wbox100 = SizedBox(width: 100);

  final _greyBoldS45Style = TextStyle(color: Colors.grey.shade400, fontSize: 45, fontWeight: FontWeight.bold);
  final _blackBoldS45Style = TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold);
  final _whiteW700S28Style = TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700);
  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);
  final _completedStyle =
      TextStyle(fontSize: 22, color: Colors.black, decorationColor: Colors.red, decoration: TextDecoration.lineThrough);
  final _uncompletedStyle =
      TextStyle(fontSize: 22, color: Colors.black, decorationColor: Colors.red, decoration: TextDecoration.none);

  final _menuIcon = Icon(Icons.menu, size: 30);
  final _calendarAltIcon = Icon(FontAwesomeIcons.calendarAlt, size: 30);
  final _addIcon = Icon(Icons.add);

  final _insetsL20 = EdgeInsets.only(left: 20);
  final _insetsL10 = EdgeInsets.only(left: 10);
  final _insetsL30T60 = EdgeInsets.only(top: 60, left: 30);

  final _spacer = Spacer();

  final _durationMs250 = Duration(milliseconds: 250);
}

const _color1 = Color(0xffFA696C);
const _color2 = Color(0xffFA8165);
const _color3 = Color(0xffFB8964);
