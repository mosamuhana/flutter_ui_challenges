import 'package:flutter/material.dart';

import '../../../core/ui_constants.dart';

const _maxAppBarHeight = 190.0;
const _minAppBarHeight = 80.0;
const _radius = 30.0;

class FancyAppbarAnimationPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/fancy_appbar_animation.page.dart";

  @override
  _FancyAppbarAnimationPageState createState() => _FancyAppbarAnimationPageState();
}

class _FancyAppbarAnimationPageState extends State<FancyAppbarAnimationPage> {
  final pageTitle = 'Awesome and simple app bar hiding animation';

  ScrollController _scrollController = ScrollController();
  Color appBarBackground;
  double topPosition;

  @override
  void initState() {
    topPosition = -_minAppBarHeight;
    appBarBackground = Colors.transparent;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if (offset > 50) {
      if (topPosition < 0) {
        topPosition = -130 + offset;
        if (offset > 130) topPosition = 0;
        setState(() {});
      }
    } else {
      if (topPosition > -_minAppBarHeight) {
        topPosition--;
        if (offset <= 0) topPosition = -_minAppBarHeight;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                _buildFancyAppBar(context),
                hSizedBox20,
                Container(height: 300, color: Colors.orange),
                hSizedBox10,
                Container(height: 300, color: Colors.red),
                hSizedBox10,
                Container(height: 300, color: Colors.yellow),
                hSizedBox10,
                Container(height: 300, color: Colors.pink),
                hSizedBox20,
              ],
            ),
          ),
          _buildFloatingAppBar(context),
          _buildStandardAppBar(context),
        ],
      ),
    );
  }

  Widget _buildFancyAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 50),
      height: _maxAppBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(_radius)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: _minAppBarHeight - 10.0),
          Text(
            pageTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          hSizedBox20,
          Text(
            "AWESOME",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.orange),
          )
        ],
      ),
    );
  }

  Widget _buildFloatingAppBar(BuildContext context) {
    double opacity = (topPosition + _minAppBarHeight) / _minAppBarHeight;
    opacity = opacity > 1 || opacity < 0 ? 1 : opacity;
    //print('topPosition: $topPosition');

    return Positioned(
      top: topPosition,
      left: 0,
      right: 0,
      child: Container(
        height: _minAppBarHeight,
        padding: const EdgeInsets.only(left: 50, top: 25.0, right: 20.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(_radius)),
          color: Colors.white.withOpacity(opacity),
        ),
        child: DefaultTextStyle(
          style: TextStyle(),
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          child: Semantics(
            child: Text(
              pageTitle,
              style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            header: true,
          ),
        ),
      ),
    );
  }

  Widget _buildStandardAppBar(BuildContext context) {
    return SizedBox(
      height: _minAppBarHeight,
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
