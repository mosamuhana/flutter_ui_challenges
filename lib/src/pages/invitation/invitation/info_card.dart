import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String valueType;

  InfoCard({
    Key key,
    this.title,
    this.subtitle,
    this.value,
    this.valueType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: _insetsH16V8,
      child: Padding(
        padding: _insets16,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${title ?? ""}'),
                Text('${subtitle ?? ""}'),
              ],
            ),
            _spacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${value ?? ""}'),
                Text('${valueType ?? ""}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final _insets16 = EdgeInsets.all(16);
  final _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  final _spacer = Spacer();
}
