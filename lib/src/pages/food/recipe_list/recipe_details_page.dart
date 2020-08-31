import 'dart:io';

import 'package:flutter/material.dart';

import 'data.dart';
import 'models.dart';
import 'recipe_step.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  final List<Recipe> recipeList = getRecipes();

  RecipeDetailsPage({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: _arrowBackIcon,
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          FlatButton.icon(
            icon: _playCircleFilledIcon,
            label: Text('Watch Recipe'),
            onPressed: () => print('Watch Recipe'),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: _insets20,
              children: [
                Text(recipe.title.toUpperCase(), style: _w600S24Style),
                _hbox16,
                Text(recipe.description),
                _hbox20,
                _infoContainer,
                _hbox20,
                ...recipeStepList,
              ],
            ),
          ),
          _recipeImageList,
        ],
      ),
    );
  }

  Widget get _infoContainer {
    final _calories = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _memoryIcon,
        _wbox5,
        Text('${recipe.calories}'),
      ],
    );

    final _category = Text(recipe.category, textAlign: TextAlign.center);

    final _time = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _timerIcon,
        _wbox5,
        Text(recipe.time),
      ],
    );

    return Container(
      height: 30,
      child: Row(
        children: [
          Expanded(child: _calories),
          _verticalDivider,
          Expanded(child: _category),
          _verticalDivider,
          Expanded(child: _time),
        ],
      ),
    );
  }

  Widget get _recipeImageList {
    final list = <Widget>[];

    for (var i = 0; i < recipeList.length; i++) {
      list.addAll([
        if (i > 0) _wbox10,
        Container(
          width: 80,
          decoration: BoxDecoration(
            borderRadius: _circularBorder10,
            image: DecorationImage(image: NetworkImage(recipeList[i].image), fit: BoxFit.cover),
          ),
        ),
      ]);
    }

    return Material(
      elevation: 10,
      color: Colors.white,
      child: Container(
        padding: _insets10,
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: list,
        ),
      ),
    );
  }

  List<Widget> get recipeStepList {
    final list = <Widget>[];
    for (var i = 0; i < recipe.steps.length; i++) {
      if (i > 0) {
        list.add(_hbox30);
      }
      list.add(RecipeStep(step: i + 1, content: recipe.steps[i]));
    }
    return list;
  }

  final _hbox16 = SizedBox(height: 16);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
  final _wbox5 = SizedBox(width: 5);
  final _wbox10 = SizedBox(width: 10);

  final _arrowBackIcon = Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back, color: Colors.black);

  final _playCircleFilledIcon = Icon(Icons.play_circle_filled, color: Colors.red);
  final _timerIcon = Icon(Icons.timer);
  final _memoryIcon = Icon(Icons.memory);

  final _w600S24Style = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

  final _insets10 = EdgeInsets.all(10);
  final _insets20 = EdgeInsets.all(20);

  final _verticalDivider = VerticalDivider();

  final _circularBorder10 = BorderRadius.circular(10);
}
