import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/widgets.dart';
import 'action_heading.dart';
import 'post_card.dart';
import 'featured_news_card.dart';
import 'data.dart';
import 'models.dart';

class NewsHomePage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/news_home/page.dart";

  final List<FeaturedNewsItem> featuredNewsItems = getFeaturedNews();

  final List<Post> posts = getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView(
        children: [
          _featuredNews,
          _hbox10,
          _postList,
          _categoryGrid,
        ],
      ),
    );
  }

  Widget get _featuredNews {
    return RoundedContainer(
      height: 270,
      borderRadius: _circularBorder0,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Featured News", style: _whiteBoldS28Style),
          Expanded(
            child: Swiper(
              pagination: SwiperPagination(margin: _insets0),
              viewportFraction: 0.9,
              itemCount: featuredNewsItems.length,
              loop: false,
              itemBuilder: (_, i) => FeaturedNewsCard(item: featuredNewsItems[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _postList {
    return Column(
      children: [
        ActionHeading(title: "Popular posts", onPressed: () {}),
        PostCard(item: posts[0]),
        PostCard(item: posts[1]),
        PostCard(item: posts[2]),
        PostCard(item: posts[3]),
      ],
    );
  }

  Widget get _categoryGrid {
    final categoryBox = Expanded(
      child: Container(
        height: 100,
        width: 100,
        margin: _insetsH4,
        decoration: _categoryDecoration,
      ),
    );

    final row = Padding(
      padding: _insetsH4,
      child: Row(
        children: List.generate(3, (index) => categoryBox).toList(),
      ),
    );

    return Column(
      children: [
        ActionHeading(title: "Browse by category", onPressed: () {}),
        row,
        _hbox10,
        row,
        _hbox10,
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);

  final _whiteBoldS28Style = TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold);

  final _insetsH4 = EdgeInsets.symmetric(horizontal: 4);
  final _insets0 = EdgeInsets.only();

  final _circularBorder0 = BorderRadius.circular(0);

  final _categoryDecoration = BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green.shade200);
}
