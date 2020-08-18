import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TodoHomeOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/todo/todo_home1.dart";

  @override
  _TodoHomeOnePageState createState() => _TodoHomeOnePageState();
}

class _TodoHomeOnePageState extends State<TodoHomeOnePage> {
  final _tasks = [..._todoList];
  ScrollController _controller;
  int _index = 0;

  int get completed => _tasks.where((x) => x.completed).length;
  int get uncompleted => _tasks.where((x) => !x.completed).length;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });

    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingActionButton,
      body: SingleChildScrollView(
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
    final task = _Task(title: 'New Task ${++_index}');
    _tasks.add(task);
    setState(() {});
  }

  Future<void> _scrollToEnd() {
    final offset = _controller.position.maxScrollExtent + 60;
    return _controller.animateTo(offset, duration: _durationMs250, curve: Curves.ease);
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _todoList = <_Task>[
  _Task(title: "Buy computer science book from Agarwal book store", completed: true),
  _Task(title: "Send updated logo and source files", completed: false),
  _Task(title: "Recharge broadband bill", completed: false),
  _Task(title: "Pay telephone bill", completed: false),
];

class _Task {
  String title;
  bool completed;
  _Task({this.title, this.completed = false});
}

// ----------------------------------------------------------------------------------
// Private Static Data --------------------------------------------------------------
// ----------------------------------------------------------------------------------

const _color1 = Color(0xffFA696C);
const _color2 = Color(0xffFA8165);
const _color3 = Color(0xffFB8964);

const _headerShadow1 = BoxShadow(color: _color2, offset: Offset(4, 4), blurRadius: 10);
const _headerShadow2 = BoxShadow(color: _color3, offset: Offset(1, 1), blurRadius: 4);

const _hbox10 = SizedBox(height: 10);
const _hbox30 = SizedBox(height: 30);
const _hbox40 = SizedBox(height: 40);
const _wbox20 = SizedBox(width: 20);
const _wbox100 = SizedBox(width: 100);

final _greyBoldS45Style = TextStyle(color: Colors.grey.shade400, fontSize: 45, fontWeight: FontWeight.bold);
const _blackBoldS45Style = TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold);
const _whiteW700S28Style = TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700);
const _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);
const _completedStyle =
    TextStyle(fontSize: 22, color: Colors.black, decorationColor: Colors.red, decoration: TextDecoration.lineThrough);
const _uncompletedStyle =
    TextStyle(fontSize: 22, color: Colors.black, decorationColor: Colors.red, decoration: TextDecoration.none);

const _menuIcon = Icon(Icons.menu, size: 30);
const _calendarAltIcon = Icon(FontAwesomeIcons.calendarAlt, size: 30);
const _addIcon = Icon(Icons.add);

const _insetsL20 = EdgeInsets.only(left: 20);
const _insetsL10 = EdgeInsets.only(left: 10);
const _insetsL30T60 = EdgeInsets.only(top: 60, left: 30);

const _spacer = Spacer();

const _durationMs250 = Duration(milliseconds: 250);
