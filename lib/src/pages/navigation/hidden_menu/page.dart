import 'package:flutter/material.dart';

class HiddenMenuPage extends StatefulWidget {
  static final String path = "lib/src/pages/navigation/hidden_menu/page.dart";

  _HiddenMenuPageState createState() => _HiddenMenuPageState();
}

class _HiddenMenuPageState extends State<HiddenMenuPage> with TickerProviderStateMixin {
  bool menuShown = false;
  double appbarHeight = 80;
  double menuHeight = 0;
  Animation<double> openAnimation, closeAnimation;
  AnimationController openController, closeController;

  void initState() {
    super.initState();

    openController = AnimationController(duration: _duration200, vsync: this);
    closeController = AnimationController(duration: _duration200, vsync: this);

    openAnimation = Tween<double>(begin: 0, end: 1).animate(openController)
      ..addListener(() => setState(() => menuHeight = openAnimation.value));
    closeAnimation = Tween<double>(begin: 1, end: 0).animate(closeController)
      ..addListener(() => setState(() => menuHeight = closeAnimation.value));
  }

  @override
  void dispose() {
    openController.dispose();
    closeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.pink,
              height: menuHeight,
              child: Column(
                children: [
                  _hbox10,
                  _menuBar,
                  _hbox40,
                  _menuItemList,
                ],
              ),
            ),
            _pageContent,
          ],
        ),
      ),
    );
  }

  Widget get _menuBar {
    return Row(
      children: [
        IconButton(
          icon: Icon(menuShown ? Icons.cancel : Icons.menu),
          color: Colors.white,
          onPressed: () {
            openController.reset();
            closeController.reset();
            menuShown = !menuShown;
            menuShown ? openController.forward() : closeController.forward();
            setState(() {});
          },
        ),
        Text(
          menuShown ? "Menu" : "Home",
          style: _whiteW400S18Style,
        ),
      ],
    );
  }

  Widget get _menuItemList {
    final items = <String>['Home', 'Cart', 'Wishlist', 'Profile'];
    return Expanded(
      child: ListView(
        children: [
          for (var item in items)
            Container(
              padding: _insetsB10,
              alignment: Alignment.center,
              child: Text(item, style: _whiteW400S18Style),
            ),
        ],
      ),
    );
  }

  Widget get _pageContent {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.only(top: menuHeight * (constraints.maxHeight - 60) + 60),
          color: Colors.transparent,
          child: Material(
            elevation: 16,
            shape: _pageContentShape,
            child: ListView.builder(
              padding: _insetsT60,
              itemBuilder: (_, i) {
                var index = i + 1;
                return ListTile(
                  leading: CircleAvatar(child: Text(index.toString())),
                  title: Text("List item $index"),
                );
              },
              itemCount: 100,
            ),
          ),
        );
      },
    );
  }

  final _duration200 = Duration(milliseconds: 200);

  final _hbox10 = SizedBox(height: 10);
  final _hbox40 = SizedBox(height: 40);

  final _whiteW400S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18);

  final _insetsB10 = EdgeInsets.only(bottom: 10);
  final _insetsT60 = EdgeInsets.only(top: 60);

  final _pageContentShape = BeveledRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(46)));
}
