import 'package:flutter/material.dart';

import '../../../core/res/assets.dart' as assets;
import '../../../core/widgets.dart';

final _account = _Account(
  nickname: 'Little Butterfly',
  name: 'Kathmandu',
  job: 'Product Designer',
  imageUrl: assets.avatars[1],
  likes: '285',
  comments: '3025',
  favourites: '650',
  info: [
    _InfoItem(name: 'Email', value: 'butterfly.little@gmail.com', icon: Icons.email),
    _InfoItem(name: 'Phone', value: '+977-9815225566', icon: Icons.phone),
    _InfoItem(name: 'Website', value: 'https://www.littlebutterfly.com', icon: Icons.web),
    _InfoItem(
      name: 'About',
      value:
          'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab.',
      icon: Icons.person,
    ),
    _InfoItem(name: 'Joined Date', value: '15 February 2019', icon: Icons.calendar_view_day),
  ],
);

class Profile3Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile3.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PNetworkImage(_account.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _account.nickname,
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(_account.job),
                                    subtitle: Text(_account.name),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                _buildCountinfo('Likes', _account.likes),
                                _buildCountinfo('Comments', _account.comments),
                                _buildCountinfo('Favourites', _account.favourites),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(image: NetworkImage(_account.imageUrl), fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(title: Text("User information")),
                        Divider(),
                        for (var item in _account.info)
                          ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.value),
                            leading: Icon(item.icon),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCountinfo(String name, String value) {
    return Expanded(
      child: Column(
        children: <Widget>[Text(value), Text(name)],
      ),
    );
  }
}

class _Account {
  final String nickname;
  final String name;
  final String job;
  final String imageUrl;
  final String likes;
  final String comments;
  final String favourites;
  final List<_InfoItem> info;
  _Account({
    this.nickname,
    this.name,
    this.job,
    this.imageUrl,
    this.likes,
    this.comments,
    this.favourites,
    this.info,
  });
}

class _InfoItem {
  final String name;
  final String value;
  final IconData icon;
  _InfoItem({this.name, this.value, this.icon});
}
