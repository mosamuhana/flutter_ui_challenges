import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoHomeTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/todo/todo_home2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: HeaderFooterwidget(
        header: _buildDateHeader(DateTime.now()),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTask(color: Colors.pink.shade300),
              SizedBox(height: 20),
              _buildTaskTwo(),
              SizedBox(height: 20),
              _buildTask(color: Colors.indigo.shade300),
              SizedBox(height: 20),
              _buildTaskTwo(),
            ],
          ),
        ),
        footer: _buildBottomBar(),
      ),
    );
  }

  Container _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        children: [
          SizedBox(width: 5),
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
          )
        ],
      ),
    );
  }

  Widget _buildDateHeader(DateTime date) {
    final TextStyle boldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 2);
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MaterialButton(
            minWidth: 0,
            elevation: 0,
            highlightElevation: 0,
            textColor: Colors.pink,
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 8,
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat.MMM().format(date).toUpperCase()),
                SizedBox(height: 5),
                Text(
                  DateFormat.d().format(date),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.EEEE().format(date).toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            Text(
              "Today".toUpperCase(),
              style: boldStyle,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildTaskTwo() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: Colors.white70,
      ),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "10:30 - 11:30AM",
            style: TextStyle(letterSpacing: 2.5, color: Colors.pink),
          ),
          SizedBox(height: 5),
          Text(
            "Meeting With",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 16),
          ),
          Text("John Doe"),
          SizedBox(height: 5),
          Divider(
            color: Colors.pink,
          ),
        ],
      ),
    );
  }

  Container _buildTask({Color color = Colors.indigo}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: color,
      ),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "10:30 - 11:30AM",
            style: TextStyle(letterSpacing: 2.5, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            "Meeting With",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          Text("John Doe")
        ],
      ),
    );
  }
}

class HeaderFooterwidget extends StatelessWidget {
  final Widget header;
  final Widget footer;
  final Widget body;
  final Color headerColor;
  final Color footerColor;
  final double headerHeight;

  const HeaderFooterwidget(
      {Key key,
      this.header,
      this.footer,
      this.body,
      this.headerColor = Colors.indigo,
      this.footerColor = Colors.pink,
      this.headerHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Stack _buildBody() {
    return Stack(
      children: [
        Positioned(
          top: 20,
          bottom: 120,
          right: 0,
          width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: headerColor),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(color: footerColor),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 0,
          width: 10,
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(color: headerColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
          ),
        ),
        Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: body,
              ),
            ),
            SizedBox(height: 10),
            footer,
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      height: headerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
        color: headerColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: header,
    );
  }
}
