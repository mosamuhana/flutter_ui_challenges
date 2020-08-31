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
    return Stack(
      children: [
        // right bar
        Positioned(
          top: 20,
          bottom: 120,
          right: 0,
          width: 30,
          child: DecoratedBox(decoration: BoxDecoration(color: headerColor)),
        ),
        // bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 120,
          child: DecoratedBox(decoration: BoxDecoration(color: footerColor)),
        ),
        // right small bar
        Positioned(
          bottom: 100,
          right: 0,
          width: 10,
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: _bottomLeftCircularBorder20,
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
                borderRadius: _bottomLeftCircularBorder30,
                color: headerColor,
              ),
              padding: _insetsH16V10,
              child: header,
            ),
            Expanded(
              child: Container(
                margin: _insetsR10,
                decoration: BoxDecoration(color: Colors.white, borderRadius: _circularBorder20),
                child: body,
              ),
            ),
            _hbox10,
            footer,
          ],
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _insetsH16V10 = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  final _insetsR10 = EdgeInsets.only(right: 10);

  final _circularBorder20 = BorderRadius.circular(20);
  final _bottomLeftCircularBorder30 = BorderRadius.only(bottomLeft: Radius.circular(30));
  final _bottomLeftCircularBorder20 = BorderRadius.only(bottomLeft: Radius.circular(20));
}
