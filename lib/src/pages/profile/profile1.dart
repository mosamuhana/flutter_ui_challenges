import 'package:flutter/material.dart';

import '../../../core/res/assets.dart' as assets;

final _dummyData = <String, String>{
  'Email': 'ram@kumar.com',
  'Phone': '+977 9818225533',
  'Twitter': '@ramkumar',
  'Facebook': 'facebook.com/ramkumar',
};

class ProfileOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("View Profile"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          _buildHeader(context),
          _buildCounters(context),
          ..._buildListItems(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.5, 0.9],
          colors: [Colors.red, Colors.deepOrange.shade300],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                child: CircleAvatar(
                  child: Icon(Icons.call, size: 30.0),
                  minRadius: 30.0,
                  backgroundColor: Colors.red.shade600,
                ),
                onTap: _onCall,
              ),
              CircleAvatar(
                minRadius: 60,
                backgroundColor: Colors.deepOrange.shade300,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(assets.images[0]),
                  minRadius: 55,
                ),
              ),
              InkWell(
                child: CircleAvatar(
                  child: Icon(Icons.message, size: 30.0),
                  minRadius: 30.0,
                  backgroundColor: Colors.red.shade600,
                ),
                onTap: _onMessage,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text("Ram Kumar", style: TextStyle(fontSize: 22.0, color: Colors.white)),
          Text("Kathmandu, Nepal", style: TextStyle(fontSize: 14.0, color: Colors.red.shade700))
        ],
      ),
    );
  }

  Widget _buildCounters(BuildContext context) {
    return Container(
      // height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.deepOrange.shade300,
              child: ListTile(
                title: Text(
                  "50895",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                subtitle: Text(
                  "FOLLOWERS",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: ListTile(
                title: Text(
                  "34524",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                subtitle: Text(
                  "FOLLOWING",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildListItems(BuildContext context) {
    final titleStyle = TextStyle(color: Colors.deepOrange, fontSize: 12.0);
    final subtitleStyle = TextStyle(fontSize: 18.0);

    final list = _dummyData.entries.map<Widget>((e) {
      return ListTile(
        title: Text(e.key, style: titleStyle),
        subtitle: Text(e.value, style: subtitleStyle),
      );
    });

    return [
      for (var item in list) ...[item, Divider()]
    ];
  }

  void _onCall() {
    print('CALL');
  }

  void _onMessage() {
    print('MESSAGE');
  }
}
