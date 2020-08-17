import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/widgets.dart';
import 'recipe_details.dart';
import 'data/recipe_data.dart' show Recipe, recipeList;

class RecipeSinglePage extends StatelessWidget {
  static final String path = "lib/src/pages/food/recipe_single.dart";

  final Recipe recipe = recipeList[4];
  final String recipeCategory = 'Vegetarian';
  final String recipeCalories = '65%';
  final String recipeTime = '10 min';
  final String recipeMakeDetails = 'In a small bowl, combine,\ncinnamon, nutmeg and sugar and \nset aside briefly.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: _imageHeight,
              left: 0,
              right: 0,
              bottom: 0,
              child: _detailsContainer,
            ),
            _recipeImageContainer,
            Positioned(
              top: _imageHeight - 25,
              left: 20,
              child: _playButton,
            ),
            Positioned(
              top: _imageHeight - 25,
              right: 20,
              child: _readMoreButton(context),
            ),
            _appBar,
          ],
        ),
      ),
    );
  }

  Widget get _appBar {
    return Container(
      height: 70,
      child: AppBar(backgroundColor: Colors.transparent, elevation: 0),
    );
  }

  Widget get _detailsContainer {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: _infoBackground,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 150,
          bottom: 80,
          child: _infoDetailBackground,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _infoDetailContainer,
        ),
      ],
    );
  }

  Widget get _infoDetailContainer {
    return Container(
      padding: _insets16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hbox40,
          Text(recipe.title.toUpperCase(), style: _whiteW600S30Style),
          _hbox20,
          Text(recipeMakeDetails, style: _white70Style),
          _hbox50,
          SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              children: [
                _fireIcon,
                _wbox5,
                Text(recipeCalories, style: _whiteS18Style),
                _spacer,
                _verticalDivider,
                _spacer,
                Text(recipeCategory, style: _whiteS18Style),
                _spacer,
                _verticalDivider,
                _spacer,
                _stopwatchIcon,
                _wbox5,
                Text(recipeTime, style: _whiteS18Style),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _recipeImageContainer {
    return Container(
      height: 380,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        boxShadow: [_imageBlack38B30Shadow],
      ),
      child: SizedBox(
        height: _imageHeight,
        child: PNetworkImage(recipe.image, fit: BoxFit.cover),
      ),
    );
  }

  Widget get _playButton {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 25,
      child: IconButton(
        icon: _playArrowIcon,
        onPressed: () => print('PLAY'),
      ),
    );
  }

  Widget _readMoreButton(BuildContext context) {
    return RaisedButton(
      child: Text('READ MORE'),
      color: Colors.white,
      shape: _readMoreButtonShape,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeDetailsPage()));
      },
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _imageHeight = 350.0;

const _whiteW600S30Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30);
const _white70Style = TextStyle(color: Colors.white70);
const _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);

const _fireIcon = Icon(FontAwesomeIcons.fire, color: Colors.white);
const _stopwatchIcon = Icon(FontAwesomeIcons.stopwatch, color: Colors.white);
const _playArrowIcon = Icon(Icons.play_arrow, color: Color(0xffEF412D));

const _insets16 = EdgeInsets.all(16);

const _circularRadius50 = Radius.circular(50);
const _circularRadius20 = Radius.circular(20);

const _circularBorderB50 = BorderRadius.only(bottomRight: _circularRadius50);
const _circularBorder20 = BorderRadius.all(_circularRadius20);

const _readMoreButtonShape = RoundedRectangleBorder(borderRadius: _circularBorder20);

const _hbox20 = SizedBox(height: 20);
const _hbox40 = SizedBox(height: 40);
const _hbox50 = SizedBox(height: 50);
const _wbox5 = SizedBox(width: 5);

const _verticalDivider = VerticalDivider(color: Colors.white);

const _spacer = Spacer();

const _imageBlack38B30Shadow = BoxShadow(color: Colors.black38, blurRadius: 30);

final _infoBackground = Container(
  height: 200,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xffE1372F), Color(0xffFF6C1C)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
);

final _infoDetailBackground = Container(
  height: 200,
  decoration: BoxDecoration(color: Color(0xffCF3529), borderRadius: _circularBorderB50),
);
