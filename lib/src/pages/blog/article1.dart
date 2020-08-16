import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class ArticleOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article One')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _image,
                _category,
              ],
            ),
            Padding(
              padding: _insetsL16R16B16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("Oct 21, 2017")),
                      IconButton(
                        icon: _shareIcon,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(_articleTitle, style: Theme.of(context).textTheme.headline6),
                  _divider,
                  _hbox10,
                  Row(
                    children: [
                      _favoriteBorderIcon,
                      _wbox5,
                      Text("20.2k"),
                      _wbox15,
                      _commentIcon,
                      _wbox5,
                      Text("2.2k"),
                    ],
                  ),
                  _hbox10,
                  Text(_articleDescription, textAlign: TextAlign.justify)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _image {
    return Container(
      height: 300,
      width: double.infinity,
      child: PNetworkImage(_articleImage, fit: BoxFit.cover),
    );
  }

  Widget get _category {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Row(
        children: [
          _slideshowIcon,
          _wbox10,
          Text(_articleCategory, style: _whiteStyle),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

const _articleTitle = "Lorem ipsum dolor sit amet";

const _articleDescription =
    "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.";

const _articleImage = '$STORE_BASE_URL/img%2F2.jpg?alt=media';
const _articleCategory = 'Technology';

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _insetsL16R16B16 = EdgeInsets.only(left: 16, right: 16, bottom: 16);

const _divider = Divider();

const _favoriteBorderIcon = Icon(Icons.favorite_border);
const _shareIcon = Icon(Icons.share);
const _commentIcon = Icon(Icons.comment);
const _slideshowIcon = Icon(Icons.slideshow, color: Colors.white);

const _whiteStyle = TextStyle(color: Colors.white);

const _hbox10 = SizedBox(height: 10);
const _wbox5 = SizedBox(width: 5);
const _wbox10 = SizedBox(width: 10);
const _wbox15 = SizedBox(width: 15);
