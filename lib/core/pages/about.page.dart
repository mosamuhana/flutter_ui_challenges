import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../github.dart';
import '../helper.dart';
import '../models.dart';
import 'data.dart';

const _about_title = 'About Flutter UI Challenges';
const _about_description =
    "Flutter UI Challenges is our effort to replicate various UIs in flutter and share it with you for free.";

class AboutPage extends StatelessWidget {
  final developersList = getDevelopers();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.deepOrange),
      child: Builder(builder: _builder),
    );
  }

  Widget _builder(BuildContext context) {
    final theme = Theme.of(context);
    final style = TextStyle(color: theme.primaryColor, fontSize: 20.0, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(title: Text(_about_title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(_about_description),
            ),
            _hbox20,
            _buildButton(
              title: 'Github',
              desc: 'Find codes to all the UIs in our github repository.',
              icon: FontAwesomeIcons.github,
              url: Github.repositoryUrl,
              style: style,
            ),
            _hbox20,
            _buildButton(
              title: 'Youtube',
              desc:
                  'Subscribe our youtube channel to see us build some of these UIs as well as other flutter tutorials and resources.',
              icon: FontAwesomeIcons.youtube,
              url: Github.youtubeChannel,
              style: style,
            ),
            _hbox20,
            Text("Contributors", style: style),
            _hbox10,
            ...developersList.map(_buildHeader).toList(),
            _hbox10,
            MaterialButton(
              color: Colors.grey.shade200,
              onPressed: () => tryLaunchUrl(Github.privacyUrl),
              child: Text("Privacy Policy"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Developer developer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.grey.shade200,
        onPressed: () => tryLaunchUrl(developer.github),
        child: Row(
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: CircleAvatar(radius: 35.0, backgroundImage: NetworkImage(developer.imageUrl)),
              ),
            ),
            _wbox20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  developer.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                _hbox10,
                Text(developer.profession),
                _hbox5,
                Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.map, size: 12.0, color: Colors.black54),
                    _wbox10,
                    Text(developer.address, style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({String title, String desc, IconData icon, String url, TextStyle style}) {
    return MaterialButton(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(16.0),
      onPressed: () => tryLaunchUrl(url),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, color: Colors.red),
              _wbox10,
              Text(title, style: style),
            ],
          ),
          _hbox10,
          Text(desc),
        ],
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10.0);
  final _wbox20 = SizedBox(width: 20.0);

  final _hbox5 = SizedBox(height: 5.0);
  final _hbox10 = SizedBox(height: 10.0);
  final _hbox20 = SizedBox(height: 20.0);
}
