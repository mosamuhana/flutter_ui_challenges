import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int _value;
  final Color color;

  final Icon _activeIcon;
  final Icon _inactiveIcon;

  int get value => _value;

  RatingWidget({
    Key key,
    this.color = Colors.white,
    @required int value,
  })  : _value = value?.clamp(0, 5) ?? 0,
        _activeIcon = Icon(Icons.star, color: color),
        _inactiveIcon = Icon(Icons.star_border, color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) => index < _value ? _activeIcon : _inactiveIcon).toList(),
    );
  }
}
