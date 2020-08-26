import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/enums.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/res/assets.dart' as assets;
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

final _edgeAll16 = EdgeInsets.all(16.0);

final _account = _Account(
  name: 'Damodar Lohani',
  title: 'Full Stack Developer',
  description:
      'Over 8+ years of experience and web development and 5+ years of experience in mobile applications development',
  address: 'Kathmandu, Nepal',
  avatar: assets.avatars[4],
  email: 'dlohani48@gmail.com',
  phone: '+977-9818523107',
  skills: [
    _Skill(name: 'Wordpress', level: 0.75),
    _Skill(name: 'Laravel', level: 0.6),
    _Skill(name: 'React JS', level: 0.65),
    _Skill(name: 'Flutter', level: 0.5),
  ],
  experiences: [
    _Experience(company: 'GID Nepal', position: 'Wordpress Developer', duration: '2010 - 2012'),
    _Experience(company: 'Lohani Tech', position: 'Laravel Developer', duration: '2012 - 2015'),
    _Experience(company: 'Popup Bits Pvt. Ltd.', position: 'Web Developer', duration: '2015 - 2018'),
    _Experience(company: 'Popup Bits Pvt. Ltd.', position: 'Flutter Developer', duration: '2018 - Current'),
  ],
  education: [
    _Experience(
        company: 'Tribhuvan University, Nepal',
        position: 'B.Sc. Computer Science and Information Technology',
        duration: '2011 - 2015'),
    _Experience(company: 'Cambridge University, UK', position: 'A Level', duration: '2008 - 2010'),
    _Experience(company: 'Nepal Board', position: 'SLC', duration: '2008'),
  ],
);

class Profile4Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile4.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.commentDots, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black54),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              margin: _edgeAll16,
              padding: _edgeAll16,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(_account.description),
            ),
            _Title(text: "Skills"),
            hSizedBox10,
            for (var skill in _account.skills) ...[
              _SkillInfo(name: skill.name, level: skill.level),
              hSizedBox5,
            ],
            hSizedBox30,
            _Title(text: "Experience"),
            for (var e in _account.experiences)
              _ExperienceInfo(company: e.company, position: e.position, duration: e.duration),
            hSizedBox20,
            _Title(text: "Education"),
            hSizedBox5,
            for (var e in _account.education)
              _ExperienceInfo(company: e.company, position: e.position, duration: e.duration),
            hSizedBox20,
            ..._buildContact(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        wSizedBox20,
        Avatar(
          image: _account.avatar,
          size: 80,
          borderWidth: 5,
          borderColor: Colors.grey,
        ),
        wSizedBox20,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _account.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            hSizedBox10,
            Text(_account.title),
            hSizedBox5,
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.map, size: 12.0, color: Colors.black54),
                wSizedBox10,
                Text(_account.address, style: TextStyle(color: Colors.black54)),
              ],
            ),
          ],
        )
      ],
    );
  }

  List<Widget> _buildContact() {
    return [
      _Title(text: "Contact"),
      hSizedBox5,
      Row(
        children: <Widget>[
          wSizedBox30,
          Icon(Icons.mail, color: Colors.black54),
          wSizedBox10,
          Text(_account.email, style: TextStyle(fontSize: 16.0)),
        ],
      ),
      hSizedBox10,
      Row(
        children: <Widget>[
          wSizedBox30,
          Icon(Icons.phone, color: Colors.black54),
          wSizedBox10,
          Text(_account.phone, style: TextStyle(fontSize: 16.0)),
        ],
      ),
      Row(
        children: <Widget>[
          wSizedBox20,
          SocialIconButton(type: SocialType.facebook, name: 'lohanidamodar'),
          wSizedBox5,
          SocialIconButton(type: SocialType.github, name: 'lohanidamodar'),
          wSizedBox5,
          SocialIconButton(type: SocialType.youtube, name: 'reactbits'),
          wSizedBox10,
        ],
      ),
      hSizedBox20,
    ];
  }
}

class _Account {
  final String name;
  final String title;
  final String description;
  final String address;
  final String avatar;
  final String email;
  final String phone;
  final List<_Skill> skills;
  final List<_Experience> experiences;
  final List<_Experience> education;
  _Account({
    this.name,
    this.title,
    this.description,
    this.address,
    this.avatar,
    this.email,
    this.phone,
    this.skills,
    this.experiences,
    this.education,
  });
}

class _Skill {
  final String name;
  final double level;
  _Skill({this.name, this.level});
}

class _Experience {
  final String company;
  final String position;
  final String duration;
  _Experience({this.company, this.position, this.duration});
}

class _SkillInfo extends StatelessWidget {
  final String name;
  final double level;

  const _SkillInfo({
    Key key,
    this.name,
    this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16.0),
        Expanded(
          flex: 2,
          child: Text(name.toUpperCase(), textAlign: TextAlign.right),
        ),
        wSizedBox10,
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(value: level),
        ),
        SizedBox(width: 16.0),
      ],
    );
  }
}

class _ExperienceInfo extends StatelessWidget {
  final String company;
  final String position;
  final String duration;

  const _ExperienceInfo({
    Key key,
    this.company,
    this.position,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text?.toUpperCase() ?? '',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.black54),
        ],
      ),
    );
  }
}
