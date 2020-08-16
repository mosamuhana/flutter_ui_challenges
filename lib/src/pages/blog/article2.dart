import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class ArticleTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Two'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              _image,
              _info(context),
            ],
          ),
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

  Widget _info(BuildContext context) {
    return Container(
      margin: _insetsL16T250R16B16,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem ipsum dolor sit amet",
            style: Theme.of(context).textTheme.headline6,
          ),
          _hbox10,
          Text("Oct 21, 2017 By DLohani"),
          _hbox10,
          _divider,
          _hbox10,
          Row(
            children: [
              Icon(Icons.favorite_border),
              _wbox5,
              Text("20.2k"),
              _wbox15,
              Icon(Icons.comment),
              _wbox5,
              Text("2.2k"),
            ],
          ),
          _hbox10,
          Text(
            "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
            textAlign: TextAlign.justify,
          ),
          _hbox10,
          Text(
            "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

const _articleImage = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox10 = SizedBox(height: 10);
const _wbox5 = SizedBox(width: 5);
const _wbox15 = SizedBox(width: 15);

const _divider = Divider();

const _insetsL16T250R16B16 = EdgeInsets.fromLTRB(16, 250, 16, 16);
