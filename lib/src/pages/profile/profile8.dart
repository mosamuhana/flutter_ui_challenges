import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

const _avatar = '$STORE_BASE_URL/img%2F1.jpg?alt=media';
const _backImage = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

class ProfileEightPage extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile8.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _ProfileHeader(
              avatar: _avatar,
              coverImage: _backImage,
              title: "Ramesh Mana",
              subtitle: "Manager",
              actions: <Widget>[
                MaterialButton(
                  color: Colors.white,
                  shape: CircleBorder(),
                  elevation: 0,
                  child: Icon(Icons.edit),
                  onPressed: () {},
                )
              ],
            ),
            hSizedBox10,
            _UserInfo(),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(color: Colors.grey, tiles: _createTiles()),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _createTiles() {
    return [
      ListTile(
        //contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Icon(Icons.my_location),
        title: Text("Location"),
        subtitle: Text("Kathmandu"),
      ),
      ListTile(
        leading: Icon(Icons.email),
        title: Text("Email"),
        subtitle: Text("sudeptech@gmail.com"),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Phone"),
        subtitle: Text("99--99876-56"),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text("About Me"),
        subtitle: Text("This is a about me link and you can khow about me in this section."),
      ),
    ];
  }
}

class _ProfileHeader extends StatelessWidget {
  final String coverImage;
  final String avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const _ProfileHeader({
    Key key,
    @required this.coverImage,
    @required this.avatar,
    @required this.title,
    this.subtitle,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(coverImage), fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(color: Colors.black38),
        ),
        if (actions != null) _buildActions(),
        _buildAvatarAndInfo(context),
      ],
    );
  }

  Widget _buildAvatarAndInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 160),
      child: Column(
        children: <Widget>[
          Avatar(
            image: avatar,
            size: 80,
            borderColor: Colors.grey.shade300,
            borderWidth: 4.0,
          ),
          Text(title, style: Theme.of(context).textTheme.headline6),
          if (subtitle != null) ...[
            hSizedBox5,
            Text(subtitle, style: Theme.of(context).textTheme.subtitle2),
          ]
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
      alignment: Alignment.bottomRight,
      child: Row(mainAxisSize: MainAxisSize.min, children: actions),
    );
  }
}
