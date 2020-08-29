import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/res/colors.dart';
import 'info_card.dart';

class InvitationPage extends StatefulWidget {
  static final String path = "lib/src/pages/invitation/invitation/page.dart";

  @override
  _InvitationPageState createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        padding: _insets16,
        child: _bodyContent,
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _appBar {
    return PreferredSize(
      child: Container(
        height: 90,
        padding: _insetsT20,
        alignment: Alignment.center,
        decoration: _appBarDecoration,
        child: ListTile(
          leading: IconButton(
            color: Colors.white,
            icon: _arrowBackIosIcon,
            onPressed: () => Navigator.of(context).pop(),
          ),
          trailing: FlatButton(
            textColor: Colors.white,
            onPressed: () => print('SKIP'),
            child: Text("Skip"),
          ),
          title: Text("Birthday Party", style: _whiteBoldS20Style),
        ),
      ),
      preferredSize: Size.fromHeight(90),
    );
  }

  Widget get _bodyContent {
    switch (activeIndex) {
      case 0:
        return _bodyContent1;
      case 1:
        return _bodyContent2;
      case 2:
        return _bodyContent3;
    }
    return Container();
  }

  Widget get _bodyContent1 {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(AVATAR)),
          title: Text("Shakwat Shamim JD", style: _nameStyle),
          subtitle: Text("New Delhi", style: _cityStyle),
        ),
        _hbox20,
        Container(
          decoration: _contentContainerDecoration,
          child: Column(
            children: [
              _imageCarousel,
              _hbox10,
              _infoRow,
              _hbox20,
              InfoCard(
                title: 'Birthday Party',
                subtitle: 'Event Name',
                value: '2019/3/4',
                valueType: 'Event Date',
              ),
              InfoCard(
                title: 'New Delhi',
                subtitle: 'Venue',
                value: '14:33:00',
                valueType: 'Time',
              ),
              _hbox20,
            ],
          ),
        ),
        _hbox20,
      ],
    );
  }

  Widget get _bodyContent2 {
    return Center(child: Text('Reject content'));
  }

  Widget get _bodyContent3 {
    return Center(child: Text('Maybe content'));
  }

  Widget get _bottomNavigationBar {
    return Container(
      height: 50,
      child: Row(
        children: [
          _wbox10,
          _bottomNavButton("Accept", 0),
          _spacer,
          _bottomNavButton("Reject", 1),
          _spacer,
          _bottomNavButton("Maybe", 2),
          _wbox10,
        ],
      ),
    );
  }

  Widget _bottomNavButton(String title, int index) {
    final active = activeIndex == index;
    final color = active ? _primaryColor : Colors.grey.shade600;
    return InkWell(
      onTap: () => setState(() => activeIndex = index),
      child: Container(
        alignment: Alignment.center,
        padding: _insets16,
        decoration: BoxDecoration(
          border: active ? _topBorder : null,
        ),
        child: Text(title, style: _buttonStyle.copyWith(color: color)),
      ),
    );
  }

  Widget get _imageCarousel {
    return Stack(
      children: [
        Container(
          height: 200,
          color: _primaryColor.withOpacity(0.1),
          padding: _insets16,
          width: double.infinity,
          child: Image.network(CAKE, fit: BoxFit.contain),
        ),
        Positioned(
          right: 0,
          top: 60,
          child: MaterialButton(
            elevation: 0,
            textColor: Colors.white,
            minWidth: 0,
            padding: _insetsH10V4,
            child: _keyboardArrowRightIcon,
            color: _primaryColor,
            onPressed: () {},
          ),
        ),
        Positioned(
          left: 0,
          top: 60,
          child: MaterialButton(
            elevation: 0,
            textColor: Colors.white,
            minWidth: 0,
            padding: _insetsH10V4,
            child: _keyboardArrowLeftIcon,
            color: _primaryColor,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget get _infoRow {
    return Padding(
      padding: _insetsH32V8,
      child: Row(
        children: [
          _solidThumbsUpIcon,
          _wbox5,
          Text("75631"),
          _spacer,
          _vLineSeparator20,
          _spacer,
          _commentIcon,
          _wbox5,
          Text("213"),
          _spacer,
          _vLineSeparator20,
          _spacer,
          _calendarTimesIcon,
          _spacer,
          _vLineSeparator20,
          _spacer,
          _locationOnIcon,
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox5 = SizedBox(width: 5);
  final _wbox10 = SizedBox(width: 10);

  final _whiteBoldS20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  final _nameStyle = TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold);
  final _cityStyle = TextStyle(color: _primaryColor, fontWeight: FontWeight.w500);

  final _buttonStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  final _insetsT20 = EdgeInsets.only(top: 20);
  final _insets16 = EdgeInsets.all(16);
  final _insetsH32V8 = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
  final _insetsH10V4 = EdgeInsets.symmetric(horizontal: 10, vertical: 4);

  final _arrowBackIosIcon = Icon(Icons.arrow_back_ios);
  final _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);
  final _keyboardArrowLeftIcon = Icon(Icons.keyboard_arrow_left);
  final _solidThumbsUpIcon = Icon(FontAwesomeIcons.solidThumbsUp, color: _primaryColor);
  final _commentIcon = Icon(FontAwesomeIcons.comment);
  final _calendarTimesIcon = Icon(FontAwesomeIcons.calendarTimes);
  final _locationOnIcon = Icon(Icons.location_on);

  final _topBorder = Border(top: BorderSide(color: _primaryColor, width: 2));

  final _vLineSeparator20 = Container(height: 20, width: 1, color: Colors.grey);

  final _appBarDecoration = BoxDecoration(
    color: _primaryColor,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  );

  final _contentContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: borderColor),
  );

  final _spacer = Spacer();
}

const _primaryColor = Color(0xffE20056);

const AVATAR = '$STORE_BASE_URL/img%2F1.jpg?alt=media';
const CAKE = '$STORE_BASE_URL/food%2Fcake.png?alt=media';
