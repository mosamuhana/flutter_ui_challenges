import 'package:flutter/material.dart';

import 'slider_clipper.dart';
import 'springy_slider_controller.dart';

class SliderGoo extends StatelessWidget {
  final SpringySliderController controller;
  final double paddingTop;
  final double paddingBottom;
  final Widget child;

  SliderGoo({
    this.controller,
    this.paddingTop,
    this.paddingBottom,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SliderClipper(
        controller: controller,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
      ),
      child: child,
    );
  }
}
