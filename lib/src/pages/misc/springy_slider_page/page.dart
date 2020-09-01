import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';

class SpringySliderPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/springy_slider_page/page.dart";

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          textTheme: _textTheme,
          iconTheme: _iconTheme,
          /*
          leading: IconButton(
            icon: _menuIcon,
            onPressed: () {},
          ),
          */
          actions: [
            _buildTextButton("Settings", true),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(child: _springySlider),
            ),
            Container(
              color: Colors.pink,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextButton("More", false),
                  _buildTextButton("Stats", false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String title, bool isOnLight) {
    return FlatButton(
      padding: _insetsH16V10,
      onPressed: () {},
      child: Text(
        title.toUpperCase(),
        style: isOnLight ? _pinkBoldS12Style : _whiteBoldS12Style,
      ),
    );
  }

  //Widget get _springySlider => SpringySlider(markCount: 12, positiveColor: Colors.pink, negativeColor: Colors.white);
  final _springySlider = SpringySlider(markCount: 12, positiveColor: Colors.pink, negativeColor: Colors.white);

  final _whiteBoldS12Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);
  final _pinkBoldS12Style = TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 12);

  final _insetsH16V10 = EdgeInsets.symmetric(horizontal: 16, vertical: 10);

  final _textTheme = TextTheme(headline6: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 18));
  final _iconTheme = IconThemeData(color: Colors.pink);

  //final _menuIcon = Icon(Icons.menu);
}
