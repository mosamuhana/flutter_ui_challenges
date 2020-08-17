import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/core/constants.dart';

import 'data/recipe_data.dart' show Recipe, recipeList;

class RecipeDetailsPage extends StatelessWidget {
  static final String path = "lib/src/pages/food/recipe_details.dart";

  final Recipe recipe = recipeList[4];

  final String recipeDescription = _lorem1;

  final String recipeCategory = 'Vegetarian';
  final String recipeCalories = '65%';
  final String recipeTime = '10 min';
  final List<String> recipeSteps = <String>[_lorem2, _lorem2, _lorem2];

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
                Text(recipeDescription),
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
        Text('$recipeCalories'),
      ],
    );

    final _category = Text(recipeCategory, textAlign: TextAlign.center);

    final _time = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _timerIcon,
        _wbox5,
        Text(recipeTime),
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
    for (var i = 0; i < recipeSteps.length; i++) {
      if (i > 0) {
        list.add(_hbox30);
      }
      list.add(_RecipeStep(step: i + 1, content: recipeSteps[i]));
    }
    return list;
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _RecipeStep extends StatelessWidget {
  final int step;
  final String content;

  const _RecipeStep({Key key, this.step, this.content}) : super(key: key);

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
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

const breakfast = '$STORE_BASE_URL/food%2Fbreakfast.jpg?alt=media';
const meal = '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media';
const burger = '$STORE_BASE_URL/food%2Fburger.jpg?alt=media';
const frenchFries = '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media';
const fries = '$STORE_BASE_URL/food%2Ffries.jpg?alt=media';

const _lorem1 =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi.';
const _lorem2 =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia, odio ut placerat finibus, ipsum risus consectetur ligula, non mattis mi neque ac mi. Vivamus quis tellus sed erat eleifend pharetra ac non diam. Integer vitae ipsum congue, vestibulum eros quis, interdum tellus. Nunc vel dictum elit. Curabitur suscipit scelerisque.';

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox10 = SizedBox(height: 10);
const _hbox16 = SizedBox(height: 16);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);
const _wbox5 = SizedBox(width: 5);
const _wbox10 = SizedBox(width: 10);
const _wbox16 = SizedBox(width: 16);

final _arrowBackIcon = Icon(
  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
  color: Colors.black,
);

const _playCircleFilledIcon = Icon(Icons.play_circle_filled, color: Colors.red);
const _timerIcon = Icon(Icons.timer);
const _memoryIcon = Icon(Icons.memory);

const _w600S24Style = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
const _whiteBoldS18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
const _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

const _insets5 = EdgeInsets.all(5);
const _insets10 = EdgeInsets.all(10);
const _insets20 = EdgeInsets.all(20);

const _verticalDivider = VerticalDivider();

const _circularRadius10 = Radius.circular(10);
const _circularRadius5 = Radius.circular(5);

const _circularBorder10 = BorderRadius.all(_circularRadius10);
const _circularBorder5 = BorderRadius.all(_circularRadius5);

const _recipeStepNumShape = RoundedRectangleBorder(borderRadius: _circularBorder5);
