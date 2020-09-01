import 'package:flutter/material.dart';

import 'springy_slider_controller.dart';

class SliderDragger extends StatefulWidget {
  final SpringySliderController controller;
  final double paddingTop;
  final double paddingBottom;
  final Widget child;

  SliderDragger({
    this.controller,
    this.paddingTop,
    this.paddingBottom,
    this.child,
  });

  @override
  _SliderDraggerState createState() => _SliderDraggerState();
}

class _SliderDraggerState extends State<SliderDragger> {
  double startDragY;
  double startDragPercent;

  Offset get zeroOffset => (context.findRenderObject() as RenderBox).localToGlobal(const Offset(0.0, 0.0));

  void _onPanStart(DragStartDetails details) {
    startDragY = details.globalPosition.dy;
    startDragPercent = widget.controller.sliderValue;

    final sliderWidth = context.size.width;
    final sliderLeftPosition = zeroOffset.dx;
    final dragHorizontalPercent = (details.globalPosition.dx - sliderLeftPosition) / sliderWidth;

    widget.controller.startDrag(dragHorizontalPercent);
  }

  void _onPanEnd(DragEndDetails details) {
    startDragY = null;
    startDragPercent = null;

    widget.controller.endDrag();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final dragDistance = startDragY - details.globalPosition.dy;
    final sliderHeight = context.size.height - widget.paddingTop - widget.paddingBottom;
    final dragPercent = dragDistance / sliderHeight;

    final sliderWidth = context.size.width;
    final sliderLeftPosition = zeroOffset.dx;
    final dragHorizontalPercent = (details.globalPosition.dx - sliderLeftPosition) / sliderWidth;

    widget.controller.draggingPercents = Offset(dragHorizontalPercent, startDragPercent + dragPercent);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanStart: _onPanStart,
      onPanEnd: _onPanEnd,
      child: widget.child,
    );
  }
}
