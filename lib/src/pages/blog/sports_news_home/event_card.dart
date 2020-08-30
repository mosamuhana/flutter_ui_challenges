import 'package:flutter/material.dart';

import 'models.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: _circularBorder10),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: _circularTopBorder10,
                  image: DecorationImage(
                    image: NetworkImage(event.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: _insets16,
                child: Text(event.title, style: _black87BoldS20Style),
              ),
              Padding(
                padding: _insetsH16,
                child: Row(
                  children: [
                    Text(event.date, style: _greyS14Style),
                    _spacer,
                    Text(event.category, style: _greyS14Style),
                  ],
                ),
              ),
              _hbox20,
            ],
          ),
          if (event.isLive)
            Positioned(
              top: 190,
              left: 20,
              child: Container(
                color: Colors.green,
                padding: _insets4,
                child: Text("LIVE", style: _whiteS12Style),
              ),
            ),
        ],
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);

  final _greyS14Style = TextStyle(color: Colors.grey, fontSize: 14);
  final _whiteS12Style = TextStyle(color: Colors.white, fontSize: 12);

  final _black87BoldS20Style = TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold);

  final _insets4 = EdgeInsets.all(4);
  final _insets16 = EdgeInsets.all(16);
  final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);

  final _circularBorder10 = BorderRadius.circular(10);
  final _circularTopBorder10 = BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));

  final _spacer = Spacer();
}
