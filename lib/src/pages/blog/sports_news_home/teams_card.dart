import 'package:flutter/material.dart';

import 'models.dart';

class TeamsCard extends StatelessWidget {
  final Team team1;
  final Team team2;

  TeamsCard({
    Key key,
    @required this.team1,
    @required this.team2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: _circularBorder10),
      child: Padding(
        padding: _insets16,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(team1.image),
            ),
            _spacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${team1.name}', style: _greyW500S18Style),
                _hbox5,
                Text('${team1.score}', style: _boldS18Style),
              ],
            ),
            Padding(
              padding: _insetsL20T20R20,
              child: Text(":", style: _boldS18Style),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${team2.name}', style: _greyW500S18Style),
                _hbox5,
                Text('${team2.score}', style: _boldS18Style),
              ],
            ),
            _spacer,
            CircleAvatar(
              backgroundImage: NetworkImage(team2.image),
            ),
          ],
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);

  final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final _greyW500S18Style = TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w500, fontSize: 18);

  final _insets16 = EdgeInsets.all(16);
  final _insetsL20T20R20 = EdgeInsets.only(left: 20, top: 20, right: 20);

  final _circularBorder10 = BorderRadius.circular(10);

  final _spacer = Spacer();
}
