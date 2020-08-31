import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import 'wiki_category.dart';

class TodoHome3Page extends StatelessWidget {
  static final String path = "lib/src/pages/todo/todo_home3/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        //leading: _verticalMenuIcon,
        actions: [
          Padding(
            padding: _insetsH16V12,
            child: CircleAvatar(
              maxRadius: 15,
              backgroundImage: NetworkImage(_avatars[0]),
            ),
          ),
          Padding(
            padding: _insetsH16V12,
            child: _verticalMenuIcon,
          ),
        ],
      ),
      body: ListView(
        padding: _insets16,
        children: [
          _buildWikiCategories(context),
          _hbox16,
          _buildRecentWikies(context),
          _hbox20,
          _buildChannelList(context),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButton: MaterialButton(
        onPressed: () {},
        color: Colors.green,
        child: _addIcon,
        textColor: Colors.white,
        minWidth: 0,
        elevation: 4,
        padding: _insets8,
        shape: _floatingActionButtonShape,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget get _verticalMenuIcon {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4,
          width: 18,
          decoration: _circularDecoration,
        ),
        _hbox4,
        Container(
          height: 4,
          width: 12,
          decoration: _circularDecoration,
        ),
      ],
    );
  }

  Widget get _bottomNavigationBar {
    return BottomAppBar(
      elevation: 5,
      child: Row(
        children: [
          _wbox16,
          IconButton(
            icon: _homeIcon,
            onPressed: () {},
            color: Colors.deepOrange,
          ),
          _spacer,
          IconButton(
            icon: _messageIcon,
            onPressed: () {},
          ),
          _wbox16,
        ],
      ),
    );
  }

  Widget _buildWikiCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wiki Lists",
          style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        _hbox16,
        Row(
          children: [
            Expanded(
              child: WikiCategory(
                icon: FontAwesomeIcons.calendarCheck,
                label: "All Wikis",
                color: Colors.deepOrange.withOpacity(0.7),
              ),
            ),
            _wbox16,
            Expanded(
              child: WikiCategory(
                icon: FontAwesomeIcons.lock,
                label: "My private notes",
                color: Colors.blue.withOpacity(0.6),
              ),
            ),
          ],
        ),
        _hbox16,
        Row(
          children: [
            Expanded(
              child: WikiCategory(
                icon: FontAwesomeIcons.bookmark,
                label: "Bookmarked wikis",
                color: Colors.indigo.withOpacity(0.7),
              ),
            ),
            _wbox16,
            Expanded(
              child: WikiCategory(
                icon: FontAwesomeIcons.file,
                label: "Templates",
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentWikies(BuildContext context) {
    final titles = ['Brand Guideline', 'Project Grail Sprint plan', 'Personal Wiki'];
    final avatars = [_avatars[1], _avatars[2], _avatars[3]];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recently Opened Wikis", style: _deepOrangeStyle),
        _hbox10,
        for (var i = 0; i < titles.length; i++) ...[
          if (i > 0) _hbox5,
          Row(
            children: [
              CircleAvatar(radius: 15, backgroundImage: NetworkImage(avatars[i])),
              _wbox10,
              Text(titles[i], style: _greyBoldStyle)
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildChannelList(BuildContext context) {
    const titles = ['Tixio 2.0', 'Project Grail', 'Fun facts'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Channels/Group", style: _deepOrangeStyle),
            IconButton(
              icon: _addCircleOutlineIcon,
              color: Colors.greenAccent,
              onPressed: () {},
            ),
          ],
        ),
        for (var title in titles)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _circleIcon,
              _wbox10,
              Text(title),
              _spacer,
              IconButton(
                icon: _moreVertIcon,
                onPressed: () {},
              ),
            ],
          ),
      ],
    );
  }

  final _hbox4 = SizedBox(height: 4);
  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox16 = SizedBox(height: 16);
  final _hbox20 = SizedBox(height: 20);
  final _wbox10 = SizedBox(width: 10);
  final _wbox16 = SizedBox(width: 16);

  final _deepOrangeStyle = TextStyle(color: Colors.deepOrange);
  final _greyBoldStyle = TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold);

  final _insetsH16V12 = EdgeInsets.symmetric(vertical: 12, horizontal: 16);
  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);

  final _floatingActionButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  final _circularDecoration = BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(2));

  final _addCircleOutlineIcon = Icon(Icons.add_circle_outline);
  final _homeIcon = Icon(Icons.home);
  final _messageIcon = Icon(Icons.message);
  final _moreVertIcon = Icon(Icons.more_vert);
  final _addIcon = Icon(Icons.add);
  final _circleIcon = Icon(FontAwesomeIcons.circle, size: 16);

  final _spacer = Spacer();
}

const List<String> _avatars = [
  '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  '$STORE_BASE_URL/img%2F6.jpg?alt=media',
  '$STORE_BASE_URL/img%2F7.jpg?alt=media',
  '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
];
