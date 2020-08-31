import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'data.dart';
import 'quiz_options.dart';

class QuizHomePage extends StatelessWidget {
  static final String path = "lib/src/apps/quiz_app/home.dart";

  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('OpenTrivia'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          _backgroundWave,
          CustomScrollView(
            physics: _bouncingScrollPhysics,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: _insetsH16V8,
                  child: Text("Select a category to start the quiz", style: _whiteW500S16Style),
                ),
              ),
              SliverPadding(
                padding: _insets16,
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    _createCategoryButton,
                    childCount: categories.length,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createCategoryButton(BuildContext context, int index) {
    final category = categories[index];

    return MaterialButton(
      elevation: 1,
      highlightElevation: 1,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (sheetContext) => BottomSheet(
            builder: (_) => QuizOptionsDialog(category: category),
            onClosing: () {},
          ),
        );
      },
      shape: _categoryButtonShape,
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (category.icon != null) Icon(category.icon, size: 50),
          if (category.icon != null) _hbox20,
          Text(category.name, textAlign: TextAlign.center, maxLines: 3),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Data --------------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox20 = SizedBox(height: 20);

const _whiteW500S16Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16);

const _circularRadius10 = Radius.circular(10);
const _circularBorder10 = BorderRadius.all(_circularRadius10);

const _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
const _insets16 = EdgeInsets.all(16);

const _categoryButtonShape = RoundedRectangleBorder(borderRadius: _circularBorder10);

final _backgroundWave = ClipPath(
  clipper: WaveClipperTwo(),
  child: Container(
    decoration: BoxDecoration(color: Colors.deepPurple),
    height: 200,
  ),
);

const _bouncingScrollPhysics = BouncingScrollPhysics();
