import 'package:flutter/material.dart';

import 'slider_clipper.dart';
import 'slider_controller.dart';

class SliderGoo extends StatelessWidget {
  final SpringySliderController sliderController;
  final double paddingTop;
  final double paddingBottom;
  final Widget child;

  SliderGoo({
    this.sliderController,
    this.paddingTop,
    this.paddingBottom,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SliderClipper(
        sliderController: sliderController,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
      ),
      child: child,
    );
  }
}
