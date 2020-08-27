import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'models.dart';

class Profile4Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile4/page.dart";

  final profile = Profile(
    name: 'Damodar Lohani',
    title: 'Full Stack Developer',
    description:
        'Over 8+ years of experience and web development and 5+ years of experience in mobile applications development',
    address: 'Kathmandu, Nepal',
    avatar: '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
    email: 'dlohani48@gmail.com',
    phone: '+977-9818523107',
    skills: [
      Skill(name: 'Wordpress', level: 0.75),
      Skill(name: 'Laravel', level: 0.6),
      Skill(name: 'React JS', level: 0.65),
      Skill(name: 'Flutter', level: 0.5),
    ],
    experiences: [
      Experience(company: 'GID Nepal', position: 'Wordpress Developer', duration: '2010 - 2012'),
      Experience(company: 'Lohani Tech', position: 'Laravel Developer', duration: '2012 - 2015'),
      Experience(company: 'Popup Bits Pvt. Ltd.', position: 'Web Developer', duration: '2015 - 2018'),
      Experience(company: 'Popup Bits Pvt. Ltd.', position: 'Flutter Developer', duration: '2018 - Current'),
    ],
    education: [
      Experience(
          company: 'Tribhuvan University, Nepal',
          position: 'B.Sc. Computer Science and Information Technology',
          duration: '2011 - 2015'),
      Experience(company: 'Cambridge University, UK', position: 'A Level', duration: '2008 - 2010'),
      Experience(company: 'Nepal Board', position: 'SLC', duration: '2008'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: _commentDotsIcon,
            onPressed: () {},
          ),
          IconButton(
            icon: _moreVertIcon,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header,
            Container(
              margin: _insets16,
              padding: _insets16,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(profile.description),
            ),
            ..._skills,
            _hbox20,
            ..._experiences,
            _hbox20,
            ..._education,
            _hbox20,
            ..._contact,
            _hbox20,
          ],
        ),
      ),
    );
  }

  Widget get _header {
    return Row(
      children: [
        _wbox20,
        Avatar(
          image: profile.avatar,
          size: 80,
          borderWidth: 5,
          borderColor: Colors.grey,
        ),
        _wbox20,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profile.name, style: _boldS18Style),
            _hbox10,
            Text(profile.title),
            _hbox5,
            Row(
              children: [
                _mapIcon,
                _wbox10,
                Text(profile.address, style: _black54Style),
              ],
            ),
          ],
        )
      ],
    );
  }

  List<Widget> get _skills {
    return [
      _buildTitle("Skills"),
      _hbox5,
      for (var skill in profile.skills) ...[
        _buildSkill(skill.name, skill.level),
        _hbox5,
      ],
    ];
  }

  List<Widget> get _experiences {
    return [
      _buildTitle("Experience"),
      for (var e in profile.experiences) _buildExperience(e.company, e.position, e.duration),
    ];
  }

  List<Widget> get _education {
    return [
      _buildTitle("Education"),
      _hbox5,
      for (var e in profile.education) _buildExperience(e.company, e.position, e.duration),
    ];
  }

  List<Widget> get _contact {
    return [
      _buildTitle("Contact"),
      _hbox5,
      Row(
        children: [
          _wbox30,
          _emailIcon,
          _wbox10,
          Text(profile.email, style: _s16Style),
        ],
      ),
      _hbox10,
      Row(
        children: [
          _wbox30,
          _phoneIcon,
          _wbox10,
          Text(profile.phone, style: _s16Style),
        ],
      ),
      Row(
        children: [
          _wbox20,
          SocialIconButton(type: SocialType.facebook, name: 'lohanidamodar'),
          _wbox5,
          SocialIconButton(type: SocialType.github, name: 'lohanidamodar'),
          _wbox5,
          SocialIconButton(type: SocialType.youtube, name: 'reactbits'),
          _wbox10,
        ],
      ),
    ];
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: _insetsL16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text?.toUpperCase() ?? '',
            style: _boldS18Style,
          ),
          _divider,
        ],
      ),
    );
  }

  Widget _buildSkill(String name, double level) {
    return Row(
      children: [
        _wbox16,
        Expanded(
          flex: 2,
          child: Text(name.toUpperCase(), textAlign: TextAlign.right),
        ),
        _wbox10,
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(value: level),
        ),
        _wbox16,
      ],
    );
  }

  Widget _buildExperience(String company, String position, String duration) {
    return ListTile(
      leading: Padding(
        padding: _insetsL20T8,
        child: _solidCircleIcon,
      ),
      title: Text(company, style: _blackBoldStyle),
      subtitle: Text("$position ($duration)"),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox5 = SizedBox(width: 5);
  final _wbox10 = SizedBox(width: 10);
  final _wbox16 = SizedBox(width: 16);
  final _wbox20 = SizedBox(width: 20);
  final _wbox30 = SizedBox(width: 30);

  final _insets16 = EdgeInsets.all(16);
  final _insetsL16 = EdgeInsets.only(left: 16);
  final _insetsL20T8 = EdgeInsets.only(top: 8, left: 20);

  final _blackBoldStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final _black54Style = TextStyle(color: Colors.black54);
  final _s16Style = TextStyle(fontSize: 16);

  final _emailIcon = Icon(Icons.mail, color: Colors.black54);
  final _moreVertIcon = Icon(Icons.more_vert, color: Colors.black54);
  final _phoneIcon = Icon(Icons.phone, color: Colors.black54);
  final _commentDotsIcon = Icon(FontAwesomeIcons.commentDots, color: Colors.black54);
  final _mapIcon = Icon(FontAwesomeIcons.map, color: Colors.black54, size: 12);
  final _solidCircleIcon = Icon(FontAwesomeIcons.solidCircle, color: Colors.black54, size: 12);

  final _divider = Divider(color: Colors.black54);
}
