import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/res/assets.dart';
import '../../../core/ui_constants.dart';

class SportsNewsOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/sports_news1.dart";

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Color(0xffF3F3F3);
    final Color primaryColor = Color(0xffE70F0B);

    var titleTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    var teamNameTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade800,
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Feed",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ToggleButtons(
            fillColor: primaryColor,
            hoverColor: primaryColor,
            renderBorder: true,
            borderColor: Colors.grey.shade300,
            color: Colors.grey.shade800,
            selectedColor: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.footballBall),
                    hSizedBox15,
                    Text(
                      "Football",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.basketballBall),
                    hSizedBox15,
                    Text("Basketball"),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.basketballBall),
                    hSizedBox15,
                    Text("Hockey"),
                  ],
                ),
              ),
            ],
            isSelected: [
              true,
              false,
              false,
            ],
            onPressed: (index) {},
          ),
          hSizedBox15,
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatars[0]),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Libertad",
                        style: teamNameTextStyle,
                      ),
                      hSizedBox5,
                      Text(
                        "0",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      ":",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Gremio",
                        style: teamNameTextStyle,
                      ),
                      hSizedBox5,
                      Text(
                        "2",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatars[2]),
                  ),
                ],
              ),
            ),
          ),
          hSizedBox15,
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        image: DecorationImage(image: NetworkImage(images[1]), fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Liverpool beat Lyon in Geneva to end pre-season",
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Yesterday, 9:24 PM",
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Spacer(),
                          Text(
                            "Football",
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    hSizedBox20,
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          hSizedBox10,
          Divider(),
          hSizedBox10,
          ListTile(
            title: Text(
              "Cosgrove hat-tricks sparks Aberdeen",
              style: titleTextStyle,
            ),
            subtitle: Text("Yesterday, 7:02 PM | Aberdeen"),
            trailing: Container(
              width: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(images[4]),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          hSizedBox10,
          ListTile(
            title: Text(
              "Cosgrove hat-tricks sparks Aberdeen",
              style: titleTextStyle,
            ),
            subtitle: Text("Yesterday, 7:02 PM | Aberdeen"),
            trailing: Container(
              width: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(images[1]),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey.shade700,
        currentIndex: 0,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listAlt),
            title: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(FontAwesomeIcons.solidCircle, size: 8.0, color: primaryColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookmark),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.clipboard),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
