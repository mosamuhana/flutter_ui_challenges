import 'package:flutter/material.dart';

import '../../../core/res/assets.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

class ArticleTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article2.dart";
  @override
  Widget build(BuildContext context) {
    String image = images[1];
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Two'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: PNetworkImage(image, fit: BoxFit.cover),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Lorem ipsum dolor sit amet",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    hSizedBox10,
                    Text("Oct 21, 2017 By DLohani"),
                    hSizedBox10,
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
      ),
    );
  }
}
