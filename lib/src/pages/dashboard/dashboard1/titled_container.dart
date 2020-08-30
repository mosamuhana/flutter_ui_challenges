import 'package:flutter/material.dart';

class TitledContainer extends StatelessWidget {
  final String title;
  final double height;
  final Widget child;

  TitledContainer({
    Key key,
    this.title,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insets16,
      width: double.infinity,
      height: height,
      decoration: _titledContainerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _boldS28Style),
          if (child != null) ...[_hbox10, child],
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _boldS28Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 28);

  final _insets16 = EdgeInsets.all(16);

  final _titledContainerDecoration = BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white);
}
