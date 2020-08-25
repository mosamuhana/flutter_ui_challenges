import 'package:flutter/material.dart';

class FancyAppbarAnimationPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/fancy_appbar_animation/page.dart";

  @override
  _FancyAppbarAnimationPageState createState() => _FancyAppbarAnimationPageState();
}

class _FancyAppbarAnimationPageState extends State<FancyAppbarAnimationPage> {
  final pageTitle = 'Awesome and simple app bar hiding animation';

  final scrollController = ScrollController();
  double topPosition;

  @override
  void initState() {
    super.initState();
    topPosition = -_minAppBarHeight;
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _onScroll() {
    final offset = scrollController.offset;
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
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                _appBar,
                _hbox20,
                Container(height: 300, color: Colors.orange),
                _hbox10,
                Container(height: 300, color: Colors.red),
                _hbox10,
                Container(height: 300, color: Colors.yellow),
                _hbox10,
                Container(height: 300, color: Colors.pink),
                _hbox20,
              ],
            ),
          ),
          _floatingAppBar,
          _standardAppBar,
        ],
      ),
    );
  }

  Widget get _appBar {
    return Container(
      padding: _insetsL16R50,
      height: _maxAppBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(_radius)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: _minAppBarHeight - 10),
          Text(pageTitle, style: _boldStyle),
          _hbox20,
          Text("AWESOME", style: _orangeBoldS16Style)
        ],
      ),
    );
  }

  Widget get _floatingAppBar {
    double opacity = (topPosition + _minAppBarHeight) / _minAppBarHeight;
    opacity = opacity > 1 || opacity < 0 ? 1 : opacity;

    return Positioned(
      top: topPosition,
      left: 0,
      right: 0,
      child: Container(
        height: _minAppBarHeight,
        padding: _insetsL50T25R20,
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
            child: Text(pageTitle, style: _blackBoldS18Style),
            header: true,
          ),
        ),
      ),
    );
  }

  Widget get _standardAppBar {
    return SizedBox(
      height: _minAppBarHeight,
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _orangeBoldS16Style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  final _blackBoldS18Style = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);

  final _insetsL50T25R20 = EdgeInsets.only(left: 50, top: 25, right: 20);
  final _insetsL16R50 = EdgeInsets.only(left: 16, right: 50);
}

const double _maxAppBarHeight = 190;
const double _minAppBarHeight = 80;
const double _radius = 30;
