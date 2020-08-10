import 'package:flutter/material.dart';

import '../../../core/res/assets.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

class ArticleOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article1.dart";
  @override
  Widget build(BuildContext context) {
    String image = images[1];
    return Scaffold(
      appBar: AppBar(
        title: Text('Article One'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: PNetworkImage(image, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.slideshow, color: Colors.white),
                      wSizedBox10,
                      Text("Technology", style: TextStyle(color: Colors.white))
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Text("Oct 21, 2017")),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(),
                  hSizedBox10,
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite_border),
                      wSizedBox5,
                      Text("20.2k"),
                      wSizedBox15,
                      Icon(Icons.comment),
                      wSizedBox5,
                      Text("2.2k"),
                    ],
                  ),
                  hSizedBox10,
                  Text(
                    "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
