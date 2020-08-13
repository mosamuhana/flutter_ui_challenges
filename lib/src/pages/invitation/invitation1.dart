import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';
import '../../../core/res/colors.dart';

class InvitationPageOne extends StatefulWidget {
  static final String path = "lib/src/pages/invitation/invitation1.dart";

  @override
  _InvitationPageOneState createState() => _InvitationPageOneState();
}

class _InvitationPageOneState extends State<InvitationPageOne> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _appBar {
    return PreferredSize(
      child: Container(
        height: 90,
        padding: _insetsTop20,
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
          title: Text("Birthday Party", style: _whiteBold20Style),
        ),
      ),
      preferredSize: Size.fromHeight(90),
    );
  }

  Widget get _body {
    return SingleChildScrollView(
      padding: _insetsAll16,
      child: _bodyContent,
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
        _personalInfo,
        _hbox20,
        Container(
          decoration: _contentContainerDecoration,
          child: Column(
            children: [
              _imageCarousel,
              _hbox10,
              _infoRow,
              _hbox20,
              ..._infoCards,
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
        padding: _insetsAll16,
        decoration: BoxDecoration(
          border: active ? _topBorder : null,
        ),
        child: Text(title, style: _buttonStyle.copyWith(color: color)),
      ),
    );
  }

  Widget get _personalInfo {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(_avatarImageUrl)),
      title: Text("Shakwat Shamim JD", style: _nameStyle),
      subtitle: Text("New Delhi", style: _cityStyle),
    );
  }

  Widget get _imageCarousel {
    return Stack(
      children: [
        Container(
          height: 200,
          color: _primaryColor.withOpacity(0.1),
          padding: _insetsAll16,
          width: double.infinity,
          child: Image.network(_cakeImageUrl, fit: BoxFit.contain),
        ),
        Positioned(
          right: 0,
          top: 60,
          child: MaterialButton(
            elevation: 0,
            textColor: Colors.white,
            minWidth: 0,
            padding: _insetsSymmetricH10V4,
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
            padding: _insetsSymmetricH10V4,
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
      padding: _insetsSymmetricH32V8,
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

  List<_InfoCard> get _infoCards {
    return [
      _InfoCard(
        title: 'Birthday Party',
        subtitle: 'Event Name',
        value: '2019/3/4',
        valueType: 'Event Date',
      ),
      _InfoCard(
        title: 'New Delhi',
        subtitle: 'Venue',
        value: '14:33:00',
        valueType: 'Time',
      ),
    ];
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String valueType;
  const _InfoCard({
    Key key,
    this.title,
    this.subtitle,
    this.value,
    this.valueType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: _insetsSymmetricH16V8,
      child: Padding(
        padding: _insetsAll16,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${title ?? ""}'),
                Text('${subtitle ?? ""}'),
              ],
            ),
            _spacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${value ?? ""}'),
                Text('${valueType ?? ""}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _avatarImageUrl = '$STORE_BASE_URL/img%2F1.jpg?alt=media';
const _cakeImageUrl = '$STORE_BASE_URL/food%2Fcake.png?alt=media';

const Color _primaryColor = Color(0xffE20056);

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);

const _wbox5 = SizedBox(width: 5);
const _wbox10 = SizedBox(width: 10);

const _whiteBold20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
final _nameStyle = TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold);
const _cityStyle = TextStyle(color: _primaryColor, fontWeight: FontWeight.w500);

const _buttonStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

const _insetsTop20 = EdgeInsets.only(top: 20);
const _insetsAll16 = EdgeInsets.all(16);
const _insetsSymmetricH32V8 = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
const _insetsSymmetricH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const _insetsSymmetricH10V4 = EdgeInsets.symmetric(horizontal: 10, vertical: 4);

const _arrowBackIosIcon = Icon(Icons.arrow_back_ios);
const _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);
const _keyboardArrowLeftIcon = Icon(Icons.keyboard_arrow_left);
const _solidThumbsUpIcon = Icon(FontAwesomeIcons.solidThumbsUp, color: _primaryColor);
const _commentIcon = Icon(FontAwesomeIcons.comment);
const _calendarTimesIcon = Icon(FontAwesomeIcons.calendarTimes);
const _locationOnIcon = Icon(Icons.location_on);

const _topBorder = Border(top: BorderSide(color: _primaryColor, width: 2));

final _vLineSeparator20 = Container(height: 20, width: 1, color: Colors.grey);

const _appBarDecoration = BoxDecoration(
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

const _spacer = Spacer();
