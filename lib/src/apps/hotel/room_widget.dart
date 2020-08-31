import 'package:flutter/material.dart';

import 'rating_widget.dart';
import 'models.dart';

class RoomWidget extends StatelessWidget {
  final Room room;
  final VoidCallback onTap;

  RoomWidget({Key key, @required this.room, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: _insets20,
        child: ClipRRect(
          borderRadius: _circularBorder5,
          child: Container(
            child: Material(
              elevation: 5,
              borderRadius: _circularBorder5,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(room.image),
                      Positioned(right: 10, top: 10, child: _starIcon),
                      Positioned(right: 8, top: 8, child: _starBorderIcon),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          padding: _insets10,
                          color: Colors.white,
                          child: Text("\$${room.price}"),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: _insets16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(room.title, style: _boldS18Style),
                        _hbox5,
                        Text(room.subtitle),
                        _hbox10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingWidget(value: room.rating, color: Colors.green),
                            _wbox5,
                            Text("(${room.reviews} reviews)", style: _greyStyle)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _wbox5 = SizedBox(width: 5);

  final _boldS18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final _greyStyle = TextStyle(color: Colors.grey);

  final _insets20 = EdgeInsets.all(20);
  final _insets10 = EdgeInsets.all(10);
  final _insets16 = EdgeInsets.all(16);

  final _circularBorder5 = BorderRadius.circular(5);

  final _starIcon = Icon(Icons.star, color: Colors.grey.shade800, size: 20);
  final _starBorderIcon = Icon(Icons.star_border, color: Colors.white, size: 24);
}
