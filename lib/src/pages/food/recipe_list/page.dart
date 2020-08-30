import 'dart:io';

import 'package:flutter/material.dart';

import '../recipe_single/page.dart';
import '../food_delivery/recipe_data.dart' show Recipe, recipeList;

class RecipeListPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/recipe_list/page.dart";

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final recipies = recipeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _largeBackground,
          _smallBackground,
          _cornerBackground,
          _pageContent,
          _searchInput,
        ],
      ),
    );
  }

  Widget get _pageContent {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hbox30,
          _pageHeader,
          _hbox40,
          Padding(
            padding: _insetsL16,
            child: Text('MY FAVORITES', style: _whiteS16Style),
          ),
          _hbox20,
          Container(
            height: 200,
            child: ListView.builder(
              padding: _insetsL16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => _RecipeItem(recipe: recipies[i % recipies.length]),
            ),
          ),
          _hbox40,
          Container(
            height: 230,
            child: ListView.builder(
              padding: _insetsL16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => _RecipeItem(recipe: recipies[i % recipies.length], large: true),
            ),
          ),
          _hbox20,
          Container(
            height: 230,
            child: ListView.builder(
              padding: _insetsL16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => _RecipeItem(recipe: recipies[i % recipies.length], large: true),
            ),
          ),
          _hbox40,
        ],
      ),
    );
  }

  Widget get _searchInput {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.black87,
          suffixIcon: _searchIcon,
          filled: true,
          hintText: "Search your recipe",
          hintStyle: _white70Style,
        ),
      ),
    );
  }

  Widget get _pageHeader {
    return Row(
      children: [
        IconButton(
          color: Colors.white,
          iconSize: 40,
          icon: _arrowBackIcon,
          onPressed: () => Navigator.pop(context),
        ),
        _wbox40,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your customised", style: _whiteStyle),
              Text('BREAKFAST', style: _whiteBoldS24Style),
            ],
          ),
        ),
        OutlineButton(
          color: Colors.white,
          textColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          child: Text("Filter".toUpperCase()),
          onPressed: () {},
        ),
        _wbox16,
      ],
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final bool large;

  const _RecipeItem({
    Key key,
    @required this.recipe,
    this.large = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeSinglePage()));
      },
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
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _largeBackgroundColor1 = Color(0xffFE1949);
const _largeBackgroundColor2 = Color(0xffF0631C);
const _smallBackgroundColor = Color(0xffE21F3D);
const _cornerBackgroundColor = Color(0xffB5192F);

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);
const _hbox40 = SizedBox(height: 40);
const _wbox16 = SizedBox(width: 16);
const _wbox40 = SizedBox(width: 40);

const _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);
const _white70Style = TextStyle(color: Colors.white70);
const _whiteStyle = TextStyle(color: Colors.white);
const _whiteBoldS24Style = TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
const _whiteS14Style = TextStyle(color: Colors.white, fontSize: 14);

const _insetsL8 = EdgeInsets.only(left: 8);
const _insetsL16 = EdgeInsets.only(left: 16);
const _insetsR20 = EdgeInsets.only(right: 20);

const _circularRadius15 = Radius.circular(15);
const _circularRadius30 = Radius.circular(30);

const _circularBorder15 = BorderRadius.all(_circularRadius15);
const _circularBorderBR30 = BorderRadius.only(bottomRight: _circularRadius30);

const _searchIcon = Icon(Icons.search, color: Colors.white70);
final _arrowBackIcon = Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back);

final _largeBackground = Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [_largeBackgroundColor1, _largeBackgroundColor2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
);

final _smallBackground = Container(
  height: 450,
  width: 300,
  decoration: BoxDecoration(
    borderRadius: _circularBorderBR30,
    color: _smallBackgroundColor,
  ),
);

final _cornerBackground = Container(
  height: 100,
  width: 80,
  decoration: BoxDecoration(
    borderRadius: _circularBorderBR30,
    color: _cornerBackgroundColor,
  ),
);
