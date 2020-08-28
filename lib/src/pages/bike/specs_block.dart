import 'package:flutter/material.dart';

const _hbox2 = SizedBox(height: 2);
const _hbox5 = SizedBox(height: 5);
const _padding_all8 = EdgeInsets.all(8);
final _labelStyle = TextStyle(color: Colors.grey.shade800);
final _valueStyle = TextStyle(fontWeight: FontWeight.bold);

class SpecsBlock extends StatelessWidget {
  final Widget icon;
  final String label;
  final String value;

  const SpecsBlock({
    Key key,
    this.icon,
    this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: _padding_all8,
        child: Column(
          children: [
            icon,
            _hbox2,
            Text(label, style: _labelStyle),
            _hbox5,
            Text(value, style: _valueStyle),
          ],
        ),
      ),
    );
  }
}
