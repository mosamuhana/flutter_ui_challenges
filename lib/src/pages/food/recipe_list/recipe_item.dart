import 'package:flutter/material.dart';

import 'recipe_page.dart';
import 'models.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final bool large;

  RecipeItem({
    Key key,
    @required this.recipe,
    this.large = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RecipePage(recipe: recipe))),
      child: Container(
        margin: _insetsR20,
        width: large ? 150 : 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: _circularBorder15,
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
              height: large ? 180 : 150,
            ),
            _hbox10,
            Padding(
              padding: _insetsL8,
              child: Text(recipe.title.toUpperCase(), style: _whiteS14Style),
            )
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _whiteS14Style = TextStyle(color: Colors.white, fontSize: 14);

  final _insetsL8 = EdgeInsets.only(left: 8);
  final _insetsR20 = EdgeInsets.only(right: 20);

  final _circularBorder15 = BorderRadius.circular(15);
}
