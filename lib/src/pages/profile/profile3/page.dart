import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Profile3Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile3/page.dart";

  final profile = _Profile(
    nickname: 'Little Butterfly',
    name: 'Kathmandu',
    email: 'butterfly.little@gmail.com',
    phone: '+977-9815225566',
    website: 'https://www.littlebutterfly.com',
    job: 'Product Designer',
    image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    likes: '285',
    comments: '3025',
    favourites: '650',
    joinedDate: '15 February 2019',
    bio:
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: CustomImage(profile.image, fit: BoxFit.cover),
            ),
            Container(
              margin: _insetsL16T200R16B16,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: _insets16,
                        margin: _insetsT16,
                        decoration: _headerDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: _insetsL96,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profile.nickname,
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  ListTile(
                                    contentPadding: _insets0,
                                    title: Text(profile.job),
                                    subtitle: Text(profile.name),
                                  ),
                                ],
                              ),
                            ),
                            _hbox10,
                            _countsRow,
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: _circularBorder10,
                          image: DecorationImage(image: NetworkImage(profile.image), fit: BoxFit.cover),
                        ),
                        margin: _insetsL16,
                      ),
                    ],
                  ),
                  _hbox20,
                  _userInformation,
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

  Widget get _countsRow {
    Widget genItem(String name, String value) {
      return Expanded(
        child: Column(
          children: [
            Text(value),
            Text(name),
          ],
        ),
      );
    }

    return Row(
      children: [
        genItem('Likes', profile.likes),
        genItem('Comments', profile.comments),
        genItem('Favourites', profile.favourites),
      ],
    );
  }

  Widget get _userInformation {
    ListTile createListTile(String name, String value, IconData icon) {
      return ListTile(
        title: Text(name),
        subtitle: Text(value),
        leading: Icon(icon),
      );
    }

    return Container(
      decoration: _headerDecoration,
      child: Column(
        children: [
          ListTile(title: Text("User information")),
          _divider,
          createListTile('Email', profile.email, Icons.email),
          createListTile('Phone', profile.phone, Icons.phone),
          createListTile('Website', profile.website, Icons.web),
          createListTile('About', profile.bio, Icons.person),
          createListTile('Joined Date', profile.joinedDate, Icons.calendar_view_day),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _insetsL16T200R16B16 = EdgeInsets.fromLTRB(16, 200, 16, 16);
  final _insets0 = EdgeInsets.all(0);
  final _insets16 = EdgeInsets.all(16);
  final _insetsT16 = EdgeInsets.only(top: 16);
  final _insetsL96 = EdgeInsets.only(left: 96);
  final _insetsL16 = EdgeInsets.only(left: 16);

  final _circularBorder10 = BorderRadius.circular(10);

  final _headerDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5));

  final _divider = Divider();
}

class _Profile {
  final String nickname;
  final String name;
  final String email;
  final String phone;
  final String website;
  final String job;
  final String image;
  final String likes;
  final String comments;
  final String favourites;
  final String joinedDate;
  final String bio;

  _Profile({
    this.nickname,
    this.name,
    this.email,
    this.phone,
    this.website,
    this.job,
    this.image,
    this.likes,
    this.comments,
    this.favourites,
    this.joinedDate,
    this.bio,
  });
}
