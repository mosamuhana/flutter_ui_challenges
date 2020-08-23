import 'package:flutter/material.dart';

class LoaderOne extends StatefulWidget {
  final Color color;

  const LoaderOne({Key key, this.color}) : super(key: key);

  _LoaderOneState createState() => _LoaderOneState();
}

class _LoaderOneState extends State<LoaderOne> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    animation.addListener(() {
      setState(() {});
    });

    animation.addStatusListener((AnimationStatus status) {});
    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var color = widget.color;
    var value = animation.value;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: color,
            height: 3,
            width: value * 75,
          ),
          _hbox5,
          Container(
            color: color,
            height: 3,
            width: value * 50,
          ),
          _hbox5,
          Container(
            color: color,
            height: 3,
            width: value * 35,
          ),
        ],
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
}
