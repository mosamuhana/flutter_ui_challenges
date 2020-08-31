import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets.dart';
import 'recipe_details_page.dart';
import 'models.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  RecipePage({Key key, @required this.recipe}) : super(key: key);

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
            Container(
              height: 70,
              child: AppBar(backgroundColor: Colors.transparent, elevation: 0),
            ),
          ],
        ),
      ),
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
          Text(recipe.details, style: _white70Style),
          _hbox50,
          SizedBox(
            height: 30,
            width: double.infinity,
            child: Row(
              children: [
                _fireIcon,
                _wbox5,
                Text(recipe.calories, style: _whiteS18Style),
                _spacer,
                _verticalDivider,
                _spacer,
                Text(recipe.category, style: _whiteS18Style),
                _spacer,
                _verticalDivider,
                _spacer,
                _stopwatchIcon,
                _wbox5,
                Text(recipe.time, style: _whiteS18Style),
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeDetailsPage(recipe: recipe)));
      },
    );
  }

  final _imageHeight = 350.0;

  final _whiteW600S30Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30);
  final _white70Style = TextStyle(color: Colors.white70);
  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);

  final _fireIcon = Icon(FontAwesomeIcons.fire, color: Colors.white);
  final _stopwatchIcon = Icon(FontAwesomeIcons.stopwatch, color: Colors.white);
  final _playArrowIcon = Icon(Icons.play_arrow, color: Color(0xffEF412D));

  final _insets16 = EdgeInsets.all(16);

  final _readMoreButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);
  final _hbox50 = SizedBox(height: 50);
  final _wbox5 = SizedBox(width: 5);

  final _verticalDivider = VerticalDivider(color: Colors.white);

  final _spacer = Spacer();

  final _imageBlack38B30Shadow = BoxShadow(color: Colors.black38, blurRadius: 30);

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
    decoration: BoxDecoration(
      color: Color(0xffCF3529),
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
    ),
  );
}
