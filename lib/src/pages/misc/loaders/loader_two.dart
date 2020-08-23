import 'dart:math';

import 'package:flutter/material.dart';

class LoaderTwo extends StatefulWidget {
  final Color centralDotColor;
  final List<Color> colors;
  final double centralDotRadius;
  final double outerDotRadius;
  final double spanRadius;
  final Duration duration;

  LoaderTwo({
    Key key,
    this.centralDotColor = Colors.black26,
    this.centralDotRadius = 15,
    this.spanRadius = 15,
    this.duration = const Duration(seconds: 2),
    this.outerDotRadius = 5,
    this.colors = const <Color>[
      Colors.red,
      Colors.lightBlue,
      Colors.orange,
      Colors.green,
      Colors.yellow,
      Colors.blue,
      Colors.pink,
      Colors.lightGreen,
    ],
  }) : super(key: key);

  _LoaderTwoState createState() => _LoaderTwoState();
}

class _LoaderTwoState extends State<LoaderTwo> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animationRotation;
  Animation<double> animationRadiusIn;
  Animation<double> animationRadiusOut;
  double radius = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    animationRadiusIn = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1, curve: Curves.elasticIn),
      ),
    );

    animationRadiusOut = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.25, curve: Curves.elasticOut),
      ),
    );

    animationRotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 1, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      var v = controller.value;
      if (v >= 0.75 && v <= 1) {
        setState(() => radius = animationRadiusIn.value * widget.centralDotRadius);
      } else if (v >= 0 && v <= 0.25) {
        setState(() => radius = animationRadiusOut.value * widget.centralDotRadius);
      }
    });

    controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final offsets = _offsets;
    return Container(
      height: 100,
      width: 100,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: widget.centralDotRadius,
                  height: widget.centralDotRadius,
                  decoration: BoxDecoration(color: widget.centralDotColor, shape: BoxShape.circle),
                ),
              ),
              for (var i = 0; i < 8; i++)
                Transform.translate(
                  offset: offsets[i],
                  child: _createDot(i),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Offset> get _offsets {
    return [
      Offset(cos(pi / 4) * radius, sin(pi / 4) * radius),
      Offset(cos(2 * pi / 4) * radius, sin(2 * pi / 4) * radius),
      Offset(cos(3 * pi / 4) * radius, sin(3 * pi / 4) * radius),
      Offset(cos(pi) * radius, sin(pi) * radius),
      Offset(cos(5 * pi / 4) * radius, sin(5 * pi / 4) * radius),
      Offset(cos(6 * pi / 4) * radius, sin(6 * pi / 4) * radius),
      Offset(cos(7 * pi / 4) * radius, sin(7 * pi / 4) * radius),
      Offset(cos(8 * pi / 4) * radius, sin(8 * pi / 4) * radius),
    ];
  }

  Widget _createDot(int index) {
    return Center(
      child: Container(
        width: widget.outerDotRadius,
        height: widget.outerDotRadius,
        decoration: BoxDecoration(color: widget.colors[index], shape: BoxShape.circle),
      ),
    );
  }
}
