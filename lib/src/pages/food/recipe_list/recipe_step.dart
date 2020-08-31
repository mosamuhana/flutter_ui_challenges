import 'package:flutter/material.dart';

class RecipeStep extends StatelessWidget {
  final int step;
  final String content;

  RecipeStep({Key key, this.step, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var leadingTitle = step.toString().padLeft(2, '0');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          shape: _recipeStepNumShape,
          color: Colors.red,
          child: Container(
            padding: _insets5,
            child: Text(leadingTitle, style: _whiteBoldS18Style),
          ),
        ),
        _wbox16,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('STEP', style: _boldS18Style),
              _hbox10,
              Text(content),
            ],
          ),
        )
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox16 = SizedBox(width: 16);

  final _whiteBoldS18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  final _insets5 = EdgeInsets.all(5);

  final _recipeStepNumShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
}
