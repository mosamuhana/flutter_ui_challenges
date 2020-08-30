import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'data.dart';
import 'article.dart';

class Article2Page extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article2/page.dart";

  final Article article = getArticle();

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
              Container(
                height: 300,
                width: double.infinity,
                child: PNetworkImage(article.image, fit: BoxFit.cover),
              ),
              _buildDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Container(
      margin: _insetsL16T250R16B16,
      decoration: _detailsDecoration,
      padding: _insets16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(article.title, style: Theme.of(context).textTheme.headline6),
          _hbox10,
          Text('${article.date} By ${article.author}'),
          _hbox10,
          _divider,
          _hbox10,
          Row(
            children: [
              Icon(Icons.favorite_border),
              _wbox5,
              Text('${article.likes}'),
              _wbox15,
              Icon(Icons.comment),
              _wbox5,
              Text('${article.comments}'),
            ],
          ),
          ..._descriptions,
        ],
      ),
    );
  }

  List<Widget> get _descriptions {
    return [
      for (var para in article.description.split('\n')) ...[
        _hbox10,
        Text(para, textAlign: TextAlign.justify),
      ],
    ];
  }

  final _hbox10 = SizedBox(height: 10);
  final _wbox5 = SizedBox(width: 5);
  final _wbox15 = SizedBox(width: 15);

  final _divider = Divider();

  final _insets16 = EdgeInsets.all(16);
  final _insetsL16T250R16B16 = EdgeInsets.fromLTRB(16, 250, 16, 16);

  final _detailsDecoration = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5));
}
