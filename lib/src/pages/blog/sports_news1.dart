import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';

class SportsNewsOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/blog/sports_news1.dart";

  final event = _Event(
    title: 'Liverpool beat Lyon in Geneva to end pre-season',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    date: 'Yesterday, 9:24 PM',
    category: 'Football',
    isLive: true,
  );

  @override
  _SportsNewsOnePageState createState() => _SportsNewsOnePageState();
}

class _SportsNewsOnePageState extends State<SportsNewsOnePage> {
  int _currentNavIndex = 0;
  int _topButtonsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: _appBar,
      bottomNavigationBar: _bottomNavigationBar,
      body: ListView(
        padding: _insets16,
        children: [
          topButtonsBar,
          _hbox15,
          _TeamsCard(
            team1: _teams[0],
            team2: _teams[1],
          ),
          _hbox15,
          _EventCard(event: widget.event),
          _hbox10,
          Divider(),
          _hbox10,
          _ItemTile(item: _items[0]),
          _hbox10,
          _ItemTile(item: _items[1]),
        ],
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text("Feed", style: _blackS30Style),
      actions: [
        IconButton(
          color: Colors.black,
          icon: _searchIcon,
          onPressed: () {},
        )
      ],
    );
  }

  Widget get _bottomNavigationBar {
    BottomNavigationBarItem navItem(Icon icon, bool active) {
      return BottomNavigationBarItem(
        icon: icon,
        title: active ? Padding(padding: _insetsT4, child: _solidCircleIcon) : Text(''),
      );
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: _bgColor,
      selectedItemColor: _primaryColor,
      unselectedItemColor: Colors.grey.shade700,
      currentIndex: _currentNavIndex,
      onTap: (i) => setState(() => _currentNavIndex = i),
      elevation: 0,
      items: [
        navItem(_listAltIcon, _currentNavIndex == 0),
        navItem(_bookmarkIcon, _currentNavIndex == 1),
        navItem(_chartBarIcon, _currentNavIndex == 2),
        navItem(_clipboardIcon, _currentNavIndex == 3),
      ],
    );
  }

  Widget get topButtonsBar {
    return ToggleButtons(
      fillColor: _primaryColor,
      hoverColor: _primaryColor,
      renderBorder: true,
      borderColor: Colors.grey.shade300,
      color: Colors.grey.shade800,
      selectedColor: Colors.white,
      borderRadius: _circularBorder10,
      isSelected: [
        _topButtonsIndex == 0,
        _topButtonsIndex == 1,
        _topButtonsIndex == 2,
      ],
      onPressed: (i) => setState(() => _topButtonsIndex = i),
      children: [
        _createTopButton('Football', _footballBallIcon, 0),
        _createTopButton('Basketball', _basketballBallIcon, 1),
        _createTopButton('Hockey', _basketballBallIcon, 2),
      ],
    );
  }

  Widget _createTopButton(String title, Icon icon, int index) {
    return Container(
      padding: _insetsL16T16R32B16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          _hbox15,
          Text(title, style: _topButtonsIndex == index ? _boldS16Style : null),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _ItemTile extends StatelessWidget {
  final _Item item;

  const _ItemTile({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title, style: _black87BoldStyle),
      subtitle: Text("${item.date} | ${item.subtitle}"),
      trailing: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: _circularBorder10,
          image: DecorationImage(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _TeamsCard extends StatelessWidget {
  final _Team team1;
  final _Team team2;

  const _TeamsCard({
    Key key,
    @required this.team1,
    @required this.team2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: _circularBorder10),
      child: Padding(
        padding: _insets16,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(team1.image),
            ),
            _spacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${team1.name}', style: _grey800W500S18Style),
                _hbox5,
                Text('${team1.score}', style: _boldS18Style),
              ],
            ),
            Padding(
              padding: _insetsL20T20R20,
              child: Text(":", style: _boldS18Style),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${team2.name}', style: _grey800W500S18Style),
                _hbox5,
                Text('${team2.score}', style: _boldS18Style),
              ],
            ),
            _spacer,
            CircleAvatar(
              backgroundImage: NetworkImage(team2.image),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final _Event event;

  const _EventCard({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: _circularBorder10),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: _circularTop10,
                  image: DecorationImage(
                    image: NetworkImage(event.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: _insets16,
                child: Text(event.title, style: _black87BoldStyle),
              ),
              Padding(
                padding: _insetsH16,
                child: Row(
                  children: [
                    Text(event.date, style: _greyS14Style),
                    _spacer,
                    Text(event.category, style: _greyS14Style),
                  ],
                ),
              ),
              _hbox20,
            ],
          ),
          if (event.isLive)
            Positioned(
              top: 190,
              left: 20,
              child: Container(
                color: Colors.green,
                padding: _insets4,
                child: Text("LIVE", style: _whiteS12Style),
              ),
            ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _items = <_Item>[
  _Item(
    title: 'Cosgrove hat-tricks sparks Aberdeen',
    subtitle: 'Aberdeen',
    date: 'Yesterday, 7:02 PM',
    image: '$STORE_BASE_URL/img%2F5.jpg?alt=media',
  ),
  _Item(
    title: 'Cosgrove hat-tricks sparks Aberdeen',
    subtitle: 'Aberdeen',
    date: 'Yesterday, 7:02 PM',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  ),
];

final _teams = <_Team>[
  _Team(
    name: 'Libertad',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    score: 0,
  ),
  _Team(
    name: 'Gremio',
    image: '$STORE_BASE_URL/img%2F6.jpg?alt=media',
    score: 2,
  ),
];

class _Item {
  final String title;
  final String subtitle;
  final String date;
  final String image;
  _Item({this.title, this.subtitle, this.date, this.image});
}

class _Team {
  final String name;
  final String image;
  final int score;
  _Team({this.name, this.image, this.score});
}

class _Event {
  final String title;
  final String image;
  final String date;
  final String category;
  final bool isLive;
  _Event({this.title, this.image, this.date, this.category, this.isLive = false});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _bgColor = Color(0xffF3F3F3);
const _primaryColor = Color(0xffE70F0B);

const _hbox5 = SizedBox(height: 5);
const _hbox10 = SizedBox(height: 10);
const _hbox15 = SizedBox(height: 15);
const _hbox20 = SizedBox(height: 20);

const _blackS30Style = TextStyle(color: Colors.black, fontSize: 30);
const _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const _greyS14Style = TextStyle(color: Colors.grey, fontSize: 14);
const _whiteS12Style = TextStyle(color: Colors.white, fontSize: 12);

var _black87BoldStyle = TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold);
var _grey800W500S18Style = TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w500, fontSize: 18);

const _insets4 = EdgeInsets.all(4);
const _insets16 = EdgeInsets.all(16);
const _insetsT4 = EdgeInsets.only(top: 4);
const _insetsL16T16R32B16 = EdgeInsets.fromLTRB(16, 16, 32, 16);
const _insetsL20T20R20 = EdgeInsets.only(left: 20, top: 20, right: 20);
const _insetsH16 = EdgeInsets.symmetric(horizontal: 16);

final _circularBorder10 = BorderRadius.circular(10);
const _circularTop10 = BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));

const _searchIcon = Icon(Icons.search);
const _footballBallIcon = Icon(FontAwesomeIcons.footballBall);
const _basketballBallIcon = Icon(FontAwesomeIcons.basketballBall);
const _listAltIcon = Icon(FontAwesomeIcons.listAlt);
const _bookmarkIcon = Icon(FontAwesomeIcons.bookmark);
const _chartBarIcon = Icon(FontAwesomeIcons.chartBar);
const _clipboardIcon = Icon(FontAwesomeIcons.clipboard);
const _solidCircleIcon = Icon(FontAwesomeIcons.solidCircle, size: 8, color: _primaryColor);

const _spacer = Spacer();
