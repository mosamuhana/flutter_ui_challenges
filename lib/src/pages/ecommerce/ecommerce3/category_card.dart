import 'package:flutter/material.dart';

import 'models.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: _circularBorder10,
              color: Colors.black12,
              image: DecorationImage(image: NetworkImage(category.image), fit: BoxFit.cover),
            ),
            alignment: Alignment.center,
            margin: _insetsH10,
            width: 100,
            height: 100,
          ),
          _hbox10,
          Text(category.name)
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _insetsH10 = EdgeInsets.symmetric(horizontal: 10);

  final _circularBorder10 = BorderRadius.circular(10);
}
