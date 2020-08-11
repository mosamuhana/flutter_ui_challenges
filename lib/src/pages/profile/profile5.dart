import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/res/assets.dart' as assets;
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

class ProfileFivePage extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile5.dart";
  final Color color1 = Color(0xffFC5CF0);
  final Color color2 = Color(0xffFE8852);
  final String image = assets.avatars[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildHeader(),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                _buildTitle(),
                hSizedBox20,
                _buildImage(),
                hSizedBox10,
                ..._buildInfo(),
                hSizedBox5,
                _buildSocialRow(),
                hSizedBox10,
                _buildBottomBar(),
              ],
            ),
          ),
          _buildAppBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Date mate",
      style: TextStyle(color: Colors.white, fontSize: 28, fontStyle: FontStyle.italic),
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: PNetworkImage(image, fit: BoxFit.cover),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20.0)),
              child: Text("3.7mi away"),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildInfo() {
    return [
      Text(
        "Sasha - 22",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.location_on,
            size: 16.0,
            color: Colors.grey,
          ),
          Text(
            "San Diego, California, USA",
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    ];
  }

  Widget _buildSocialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SocialIconButton(type: SocialType.instagram, color: Colors.grey),
        SocialIconButton(type: SocialType.facebook, color: Colors.grey),
        SocialIconButton(type: SocialType.twitter, color: Colors.grey),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
            margin: const EdgeInsets.only(top: 30, left: 20.0, right: 20.0, bottom: 20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color1, color2]),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(FontAwesomeIcons.user),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.location_on),
                  onPressed: () {},
                ),
                Spacer(),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.message),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Center(
            child: FloatingActionButton(
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
              backgroundColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
    );
  }
}
