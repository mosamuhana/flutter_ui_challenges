import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Widget body;
  final Widget header;
  final Color headerColor;
  final Color backColor;

  const HeaderWidget({
    Key key,
    this.body,
    this.header,
    this.headerColor = Colors.white,
    this.backColor = Colors.deepPurple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          top: 0,
          width: 10,
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 100,
          width: 50,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backColor,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            if (header != null)
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0)),
                  color: headerColor,
                ),
                child: header,
              ),
            if (body != null)
              Expanded(
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))),
                  elevation: 0,
                  color: backColor,
                  child: body,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
