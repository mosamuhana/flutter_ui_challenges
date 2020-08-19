import 'package:flutter/material.dart';

class HeaderFooterwidget extends StatelessWidget {
  final Widget header;
  final Widget footer;
  final Widget body;
  final Color headerColor;
  final Color footerColor;
  final double headerHeight;

  HeaderFooterwidget({
    Key key,
    this.header,
    this.footer,
    this.body,
    this.headerColor = Colors.indigo,
    this.footerColor = Colors.pink,
    this.headerHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _radius20 = Radius.circular(20);

    return Stack(
      children: [
        // right bar
        Positioned(
          top: 20,
          bottom: 120,
          right: 0,
          width: 30,
          child: DecoratedBox(
            decoration: BoxDecoration(color: headerColor),
          ),
        ),
        // bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 120,
          child: DecoratedBox(
            decoration: BoxDecoration(color: footerColor),
          ),
        ),
        // right small bar
        Positioned(
          bottom: 100,
          right: 0,
          width: 10,
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
              //color: Colors.yellow,
              color: headerColor,
              borderRadius: BorderRadius.only(bottomLeft: _radius20),
            ),
          ),
        ),
        // middle content
        Column(
          children: [
            Container(
              height: headerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
                color: headerColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: header,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(_radius20),
                ),
                child: body,
              ),
            ),
            SizedBox(height: 10),
            footer,
          ],
        ),
      ],
    );
  }
}
