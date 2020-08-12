import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int value;

  const Rating({Key key, int value})
      : this.value = value == null ? 0 : (value < 0 ? 0 : (value > 5 ? 5 : value)),
        super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int value;
  Icon activeIcon;
  Icon inactiveIcon;

  @override
  void initState() {
    value = widget.value;
    activeIcon = Icon(Icons.star, color: Colors.amber);
    inactiveIcon = Icon(Icons.star, color: Colors.grey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [start0, start1, start2, start3, start4],
    );
  }

  Icon get start0 => value <= 0 ? inactiveIcon : activeIcon;
  Icon get start1 => value <= 1 ? inactiveIcon : activeIcon;
  Icon get start2 => value <= 2 ? inactiveIcon : activeIcon;
  Icon get start3 => value <= 3 ? inactiveIcon : activeIcon;
  Icon get start4 => value <= 4 ? inactiveIcon : activeIcon;
}
