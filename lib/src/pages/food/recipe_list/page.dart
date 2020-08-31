import 'dart:io';

import 'package:flutter/material.dart';

import 'models.dart';
import 'data.dart';
import 'recipe_item.dart';

class RecipeListPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/recipe_list/page.dart";

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final List<Recipe> recipies = getRecipes();

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
              itemBuilder: (_, i) => RecipeItem(recipe: recipies[i % recipies.length]),
            ),
          ),
          _hbox40,
          Container(
            height: 230,
            child: ListView.builder(
              padding: _insetsL16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => RecipeItem(recipe: recipies[i % recipies.length], large: true),
            ),
          ),
          _hbox20,
          Container(
            height: 230,
            child: ListView.builder(
              padding: _insetsL16,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => RecipeItem(recipe: recipies[i % recipies.length], large: true),
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

  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
  final _hbox40 = SizedBox(height: 40);
  final _wbox16 = SizedBox(width: 16);
  final _wbox40 = SizedBox(width: 40);

  final _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);
  final _white70Style = TextStyle(color: Colors.white70);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _whiteBoldS24Style = TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

  final _insetsL16 = EdgeInsets.only(left: 16);

  final _searchIcon = Icon(Icons.search, color: Colors.white70);
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
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
      color: _smallBackgroundColor,
    ),
  );

  final _cornerBackground = Container(
    height: 100,
    width: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
      color: _cornerBackgroundColor,
    ),
  );
}

const _largeBackgroundColor1 = Color(0xffFE1949);
const _largeBackgroundColor2 = Color(0xffF0631C);
const _smallBackgroundColor = Color(0xffE21F3D);
const _cornerBackgroundColor = Color(0xffB5192F);
