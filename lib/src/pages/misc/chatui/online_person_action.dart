import 'package:flutter/material.dart';

class OnlinePersonAction extends StatelessWidget {
  final String image;
  final Color color;

  OnlinePersonAction({Key key, this.image, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Container(
            padding: EdgeInsets.all(3.4),
            decoration: _decoration1,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ],
    );
  }

  final _decoration1 = BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    border: Border.all(width: 2, color: Color(0xFF558AED)),
  );
}
