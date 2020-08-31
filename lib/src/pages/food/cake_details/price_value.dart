import 'package:flutter/material.dart';

class PriceValue extends StatelessWidget {
  final double value;

  PriceValue({Key key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var v = (value * 100).round().toString();
    var i = v.length - 2;
    var integer = v.substring(0, i);
    var fraction = v.substring(i);
    return Container(
      alignment: Alignment.centerRight,
      padding: _insetsR20,
      width: double.infinity,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "\$ $integer.", style: _whiteBoldS28Style),
            TextSpan(text: "$fraction", style: _whiteStyle),
          ],
        ),
      ),
    );
  }

  final _whiteBoldS28Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28);
  final _whiteStyle = TextStyle(color: Colors.white);

  final _insetsR20 = EdgeInsets.only(right: 20);
}
