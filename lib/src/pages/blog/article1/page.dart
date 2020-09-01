import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'data.dart';
import 'article.dart';

class Article1Page extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article1/page.dart";

  final Article article = getArticle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article One')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: CustomImage(article.image, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      _slideshowIcon,
                      _wbox10,
                      Text(article.category, style: _whiteStyle),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: _insetsL16R16B16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('${article.date}')),
                      IconButton(
                        icon: _shareIcon,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(article.title, style: Theme.of(context).textTheme.headline6),
                  _divider,
                  _hbox10,
                  Row(
                    children: [
                      _favoriteBorderIcon,
                      _wbox5,
                      Text('${article.likes}'),
                      _wbox15,
                      _commentIcon,
                      _wbox5,
                      Text('${article.comments}'),
                    ],
                  ),
                  _hbox10,
                  Text(article.description, textAlign: TextAlign.justify)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox5 = SizedBox(width: 5);
  final _wbox10 = SizedBox(width: 10);
  final _wbox15 = SizedBox(width: 15);

  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _shareIcon = Icon(Icons.share);
  final _commentIcon = Icon(Icons.comment);
  final _slideshowIcon = Icon(Icons.slideshow, color: Colors.white);

  final _insetsL16R16B16 = EdgeInsets.only(left: 16, right: 16, bottom: 16);

  final _whiteStyle = TextStyle(color: Colors.white);

  final _divider = Divider();
}
