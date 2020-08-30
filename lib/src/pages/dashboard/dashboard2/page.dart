import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tile_container.dart';

class Dashboard2Page extends StatelessWidget {
  static final String path = "lib/src/pages/dashboard/dashboard2/page.dart";

  final String progressTitle = 'Overall\nDaily Progress';
  final int progressPercent = 55;

  int get progressRemaining => 100 - progressPercent;

  double get progressValue => progressPercent / 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: _insets16,
        child: Column(
          children: [
            _header,
            _hbox50,
            _tilesGrid,
          ],
        ),
      ),
    );
  }

  Widget get _header {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: _insets8,
          child: CircularProgressIndicator(
            value: progressValue,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            backgroundColor: Colors.grey.shade700,
          ),
        ),
        _wbox20,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(progressTitle, style: _whiteS20Style),
              _hbox20,
              Text("$progressRemaining% to go", style: _greyS16Style),
            ],
          ),
        )
      ],
    );
  }

  Widget get _tilesGrid {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              TileContainer(
                backgroundColor: Colors.blue,
                color: Colors.white,
                title: '9,850',
                subtitle: 'Steps',
                height: 190,
                icon: FontAwesomeIcons.walking,
              ),
              _hbox10,
              TileContainer(
                backgroundColor: Colors.green,
                color: Colors.white,
                title: '70 bpm',
                subtitle: 'Avg. Heart Rate',
                height: 120,
                icon: FontAwesomeIcons.heartbeat,
              ),
            ],
          ),
        ),
        _wbox10,
        Expanded(
          child: Column(
            children: [
              TileContainer(
                backgroundColor: Colors.red,
                color: Colors.white,
                title: '2,430',
                subtitle: 'Calories Burned',
                height: 120,
                icon: FontAwesomeIcons.fire,
              ),
              _hbox10,
              TileContainer(
                backgroundColor: Colors.yellow,
                color: Colors.black,
                title: '15 kms',
                subtitle: 'Distance',
                height: 190,
                icon: FontAwesomeIcons.road,
              ),
            ],
          ),
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox50 = SizedBox(height: 50);
  final _wbox10 = SizedBox(width: 10);
  final _wbox20 = SizedBox(width: 20);

  final _whiteS20Style = TextStyle(color: Colors.white, fontSize: 20);
  final _greyS16Style = TextStyle(color: Colors.grey, fontSize: 16);

  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);
}
