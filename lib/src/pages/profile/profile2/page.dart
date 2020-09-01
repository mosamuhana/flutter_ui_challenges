import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Profile2Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile2/page.dart";

  final profile = _Profile(
    name: 'Mebina Nepal',
    description: '"UI/UX designer | Foodie | Kathmandu"',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    posts: '302',
    followers: '10.3K',
    following: '120',
    items: <_Item>[
      _Item(title: "Food joint", image: '$STORE_BASE_URL/food%2Fmeal.jpg?alt=media'),
      _Item(title: "Photos", image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
      _Item(title: "Travel", image: '$STORE_BASE_URL/travel%2Ffishtail.jpg?alt=media'),
      _Item(title: "Nepal", image: '$STORE_BASE_URL/travel%2Fkathmandu2.jpg?alt=media'),
    ],
    images: [
      '$STORE_BASE_URL/img%2F1.jpg?alt=media',
      '$STORE_BASE_URL/img%2F2.jpg?alt=media',
      '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundContainer,
          ListView(
            children: [
              _buildHeader(context),
              Container(
                color: Colors.white,
                padding: _insetsH20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Collection",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text("Create new", style: _blueStyle),
                    )
                  ],
                ),
              ),
              _buildItemList(),
              Container(
                color: Colors.white,
                padding: _insetsL20T20B10,
                child: Text("Most liked posts", style: Theme.of(context).textTheme.headline6),
              ),
              for (var imageUrl in profile.images)
                Container(
                  color: Colors.white,
                  padding: _insetsH20V10,
                  child: ClipRRect(
                    borderRadius: _circularBorder5,
                    child: CustomImage(imageUrl, fit: BoxFit.cover),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: _insetsT50,
      height: 240,
      child: Stack(
        children: [
          Container(
            padding: _insetsL40T40R40B10,
            child: Material(
              shape: _headerShape,
              elevation: 5,
              color: Colors.white,
              child: Column(
                children: [
                  _hbox50,
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  _hbox5,
                  Text(profile.description),
                  _hbox16,
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _createCountItem('POSTS', profile.posts),
                        _createCountItem('FOLLOWERS', profile.followers),
                        _createCountItem('FOLLOWING', profile.following),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 5,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profile.image),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemList() {
    return Container(
      height: 200,
      color: Colors.white,
      padding: _insetsH10,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: profile.items.length,
        itemBuilder: (context, index) {
          final item = profile.items[index];
          return Container(
            margin: _insetsH10V5,
            width: 150,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: _circularBorder5,
                    child: CustomImage(item.image, fit: BoxFit.cover),
                  ),
                ),
                _hbox5,
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey.shade600),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _createCountItem(String name, String value) {
    return Expanded(
      child: ListTile(
        title: Text('$value', textAlign: TextAlign.center, style: _boldStyle),
        subtitle: Text('$name', textAlign: TextAlign.center, style: _s12Style),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox16 = SizedBox(height: 16);
  final _hbox50 = SizedBox(height: 50);

  final _blueStyle = TextStyle(color: Colors.blue);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);
  final _s12Style = TextStyle(fontSize: 12);

  final _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  final _insetsL20T20B10 = EdgeInsets.only(left: 20, top: 20, bottom: 10);
  final _insetsH10V5 = EdgeInsets.symmetric(vertical: 5, horizontal: 10);
  final _insetsH10 = EdgeInsets.symmetric(horizontal: 10);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
  final _insetsL40T40R40B10 = EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10);
  final _insetsT50 = EdgeInsets.only(top: 50);

  final _circularBorder5 = BorderRadius.circular(5);

  final _headerShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  final _backgroundContainer = Container(
    height: 200,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.indigo.shade300,
          Colors.indigo.shade500,
        ],
      ),
    ),
  );
}

class _Profile {
  final String name;
  final String description;
  final String image;
  final String posts;
  final String followers;
  final String following;
  final List<_Item> items;
  final List<String> images;
  _Profile({
    this.name,
    this.description,
    this.image,
    this.posts,
    this.followers,
    this.following,
    this.items,
    this.images,
  });
}

class _Item {
  final String title;
  final String image;
  _Item({this.title, this.image});
}
