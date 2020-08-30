import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final double barWidth;
  final List<double> values;
  final int activeIndex;
  final Color activeColor;
  final Color inactiveColor;

  BarChart({
    Key key,
    this.barWidth = 8,
    this.inactiveColor,
    this.activeColor,
    @required this.values,
    @required this.activeIndex,
  })  : assert(values != null && values.length > 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = values.length * barWidth + (values.length - 1) * 4;

    return Container(
      alignment: Alignment.bottomCenter,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _bars,
      ),
    );
  }

  List<Widget> get _bars {
    final _inactiveColor = inactiveColor ?? Colors.grey.shade300;
    final _activeColor = activeColor ?? Colors.blue;
    final list = <Widget>[];

    values.asMap().forEach((index, value) {
      final color = activeIndex == index ? _activeColor : _inactiveColor;
      if (index > 0) list.add(_wbox4);
      list.add(Container(width: barWidth, height: value, color: color));
    });

    return list;
  }

  final _wbox4 = SizedBox(width: 4);
}
