import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class NewsHomeOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/blog/news1.dart";

  @override
  Widget build(BuildContext context) {
    final boxRow = Padding(
      padding: _insetsH4,
      child: Row(
        children: List.generate(3, (index) => _greenBox).toList(),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _featuredNews,
          _hbox10,
          _Heading(title: "Popular posts", onPressed: () {}),
          _PostCard(item: _posts[0]),
          _PostCard(item: _posts[1]),
          _PostCard(item: _posts[2]),
          _PostCard(item: _posts[3]),
          _Heading(title: "Browse by category", onPressed: () {}),
          boxRow,
          _hbox10,
          boxRow,
          _hbox10,
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
          Text("Featured News", style: _whiteBold28Style),
          Expanded(
            child: Swiper(
              pagination: SwiperPagination(margin: _insets0),
              viewportFraction: 0.9,
              itemCount: _featuredNewsItems.length,
              loop: false,
              itemBuilder: (_, i) => _FeaturedNewsCard(item: _featuredNewsItems[i]),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _FeaturedNewsCard extends StatelessWidget {
  final _FeaturedNewsItem item;

  const _FeaturedNewsCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insets8,
      child: RoundedContainer(
        borderRadius: _circularBorder4,
        margin: _insetsB10,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            _wbox10,
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: PNetworkImage(
                  item.image,
                  fit: BoxFit.cover,
                  height: 210,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final _Post item;

  const _PostCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: _insetsH8V4,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: _insetsR10,
              decoration: BoxDecoration(
                borderRadius: _circularBorder10,
                color: item.color,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(item.title, style: _boldStyle),
                  _hbox10,
                  Text(item.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const _Heading({
    Key key,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insets8,
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: _shadedTitle),
          ),
          MaterialButton(
            elevation: 0,
            textColor: Colors.white,
            color: Colors.teal.shade300,
            height: 0,
            child: _keyboardArrowRightIcon,
            minWidth: 0,
            shape: _headerButtonShape,
            padding: _insets2,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

const __featuredNewsItemTitle = "A complete set of design elements, and their intitutive design.";
const __featuredNewsItemImage = '$STORE_BASE_URL/img%2F2.jpg?alt=media';
const __postTitle = "Lorem ipsum dolor sit amet, consecteutur adsd Ut adipisicing dolore incididunt minim";
const __postDescription = "Mollit aliquip fugiat veniam reprehenderit irure commodo eu aute ex commodo.";

final _featuredNewsItems = <_FeaturedNewsItem>[
  _FeaturedNewsItem(title: __featuredNewsItemTitle, image: __featuredNewsItemImage),
  _FeaturedNewsItem(title: __featuredNewsItemTitle, image: __featuredNewsItemImage),
  _FeaturedNewsItem(title: __featuredNewsItemTitle, image: __featuredNewsItemImage),
  _FeaturedNewsItem(title: __featuredNewsItemTitle, image: __featuredNewsItemImage),
];

final _posts = <_Post>[
  _Post(title: __postTitle, description: __postDescription, color: Colors.green.shade200),
  _Post(title: __postTitle, description: __postDescription, color: Colors.red.shade200),
  _Post(title: __postTitle, description: __postDescription, color: Colors.blue.shade200),
  _Post(title: __postTitle, description: __postDescription, color: Colors.yellow.shade200),
];

class _FeaturedNewsItem {
  final String title;
  final String image;
  _FeaturedNewsItem({this.title, this.image});
}

class _Post {
  final String title;
  final String description;
  final Color color;
  _Post({this.title, this.description, this.color});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox10 = SizedBox(height: 10);
const _wbox10 = SizedBox(width: 10);

final _shadedTitle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey.shade600);
const _boldStyle = TextStyle(fontWeight: FontWeight.bold);
const _whiteBold28Style = TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold);

const _insetsH4 = EdgeInsets.symmetric(horizontal: 4);
const _insets2 = EdgeInsets.all(2);
const _insets8 = EdgeInsets.all(8);
const _insetsR10 = EdgeInsets.only(right: 10);
const _insetsB10 = EdgeInsets.only(bottom: 20);
const _insetsH8V4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
const _insets0 = EdgeInsets.only();

final _circularBorder0 = BorderRadius.circular(0);
final _circularBorder4 = BorderRadius.circular(4);
final _circularBorder5 = BorderRadius.circular(5);
final _circularBorder10 = BorderRadius.circular(10);

const _keyboardArrowRightIcon = Icon(Icons.keyboard_arrow_right);

final _headerButtonShape = RoundedRectangleBorder(
  borderRadius: _circularBorder5,
);

final _greenBox = Expanded(
  child: Container(
    height: 100,
    width: 100,
    margin: _insetsH4,
    decoration: BoxDecoration(
      borderRadius: _circularBorder10,
      color: Colors.green.shade200,
    ),
  ),
);
