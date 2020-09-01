// Codes for stringy widgets and all corresponding widgets related to this are taken from Fluttery UI Challenges
// (https://github.com/matthew-carroll/flutter_ui_challenge_springy_slider)
// Check out the repository and give it a start

import 'package:flutter/material.dart';
import 'springy_slider_controller.dart';
import 'slider_dragger.dart';
import 'slider_goo.dart';
import 'slider_marks.dart';
import 'slider_points.dart';

class SpringySlider extends StatefulWidget {
  final int markCount;
  final Color positiveColor;
  final Color negativeColor;

  SpringySlider({
    this.markCount,
    this.positiveColor,
    this.negativeColor,
  });

  @override
  _SpringySliderState createState() => new _SpringySliderState();
}

class _SpringySliderState extends State<SpringySlider> with TickerProviderStateMixin {
  final double paddingTop = 50;
  final double paddingBottom = 50;

  SpringySliderController sliderController;

  @override
  void initState() {
    super.initState();
    sliderController = new SpringySliderController(
      sliderPercent: 0.5,
      vsync: this,
    )..addListener(_sliderListener);
  }

  @override
  void dispose() {
    sliderController.removeListener(_sliderListener);
    sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliderDragger(
      controller: sliderController,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      child: Stack(
        children: [
          SliderMarks(
            markCount: widget.markCount,
            markColor: widget.positiveColor,
            backgroundColor: widget.negativeColor,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          SliderGoo(
            controller: sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            child: SliderMarks(
              markCount: widget.markCount,
              markColor: widget.negativeColor,
              backgroundColor: widget.positiveColor,
              paddingTop: paddingTop,
              paddingBottom: paddingBottom,
            ),
          ),
          new SliderPoints(
            sliderController: sliderController,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          /*
          SliderDebug(
            sliderPercent: sliderController.state == SpringySliderState.dragging 
              ? sliderController.draggingPercent
              : sliderPercent,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          */
        ],
      ),
    );
  }

  void _sliderListener() => setState(() {});
}
