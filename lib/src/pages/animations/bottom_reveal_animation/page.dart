import 'package:bottomreveal/bottomreveal.dart';
import 'package:flutter/material.dart';

class BottomRevealAnimationPage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/bottom_reveal_animation/page.dart";

  @override
  _BottomRevealAnimationPageState createState() => _BottomRevealAnimationPageState();
}

class _BottomRevealAnimationPageState extends State<BottomRevealAnimationPage> {
  final _menuController = BottomRevealController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Reveal Example App')),
      body: BottomReveal(
        openIcon: Icons.add,
        closeIcon: Icons.close,
        revealWidth: 100,
        revealHeight: 100,
        backColor: Color(0xff2D0C3F),
        frontColor: Colors.grey.shade200,
        rightContent: _rightContent,
        bottomContent: _bottomContent,
        controller: _menuController,
        body: _bodyContent,
      ),
    );
  }

  Widget get _bodyContent {
    return ListView.builder(
      padding: _insets16,
      itemBuilder: (_, index) => Card(
        child: ListTile(
          title: Text("Item ${index + 1}"),
          leading: _cloudCircleIcon,
        ),
      ),
    );
  }

  Widget get _bottomContent {
    return TextField(
      style: _whiteS18Style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
        contentPadding: _insets16,
        prefixIcon: _searchIcon,
        border: _outlineInputBorder,
      ),
    );
  }

  Widget get _rightContent {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          height: 60,
          padding: _insets0,
          textColor: Colors.white,
          minWidth: 60,
          child: _videoLibraryIcon,
          color: Color(0xff644B77),
          elevation: 0,
          onPressed: () => _menuController.close(),
        ),
        _hbox10,
        MaterialButton(
          height: 60,
          padding: _insets0,
          textColor: Colors.white,
          minWidth: 60,
          child: _photoIcon,
          color: Color(0xff644B77),
          elevation: 0,
          onPressed: () => _menuController.close(),
        ),
        _hbox10,
        MaterialButton(
          height: 60,
          padding: _insets0,
          textColor: Colors.white,
          minWidth: 60,
          child: _cameraAltIcon,
          color: Color(0xff644B77),
          elevation: 0,
          onPressed: () => _menuController.close(),
        ),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _insets0 = EdgeInsets.all(0);
  final _insets16 = EdgeInsets.all(16);

  final _cloudCircleIcon = Icon(Icons.cloud_circle);
  final _searchIcon = Icon(Icons.search, color: Colors.white);
  final _videoLibraryIcon = Icon(Icons.video_library, size: 50);
  final _photoIcon = Icon(Icons.photo, size: 50);
  final _cameraAltIcon = Icon(Icons.camera_alt, size: 30);

  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);

  final _outlineInputBorder = OutlineInputBorder(
    gapPadding: 8,
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(30),
  );
}
