import 'package:flutter/material.dart';

import '../../../core/res/assets.dart';
import '../../../core/widgets.dart';

final _account = _Account(
  name: 'Mebina Nepal',
  description: '"UI/UX designer | Foodie | Kathmandu"',
  imageUrl: avatars[0],
  posts: '302',
  followers: '10.3K',
  following: '120',
  items: <_Item>[
    _Item(title: "Food joint", imageUrl: meal),
    _Item(title: "Photos", imageUrl: images[1]),
    _Item(title: "Travel", imageUrl: fishtail),
    _Item(title: "Nepal", imageUrl: kathmandu2),
  ],
  images: [
    images[0],
    images[1],
    images[2],
  ],
);

class Profile2Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.indigo.shade300, Colors.indigo.shade500]),
            ),
          ),
          ListView(
            children: [
              _buildHeader(context),
              _buildSectionHeader(context),
              _buildCollectionsRow(),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
                child: Text("Most liked posts", style: Theme.of(context).textTheme.headline6),
              ),
              for (var imageUrl in _account.images) _buildImageItem(imageUrl),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildSectionHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Collection",
            style: Theme.of(context).textTheme.headline6,
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Create new", style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
    );
  }

  Container _buildCollectionsRow() {
    return Container(
      color: Colors.white,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _account.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _account.items[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            width: 150.0,
            height: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: PNetworkImage(item.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey.shade600)),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 40.0,
              left: 40.0,
              right: 40.0,
              bottom: 10.0,
            ),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text(
                    _account.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 5.0),
                  Text(_account.description),
                  SizedBox(height: 16.0),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _createItem('POSTS', _account.posts),
                        _createItem('FOLLOWERS', _account.followers),
                        _createItem('FOLLOWING', _account.following),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(_account.imageUrl),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createItem(String name, String value) {
    return Expanded(
      child: ListTile(
        title: Text(
          '$value',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$name',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }

  Widget _buildImageItem(String imageUrl) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: PNetworkImage(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

class _Account {
  final String name;
  final String description;
  final String imageUrl;
  final String posts;
  final String followers;
  final String following;
  final List<_Item> items;
  final List<String> images;
  _Account({
    this.name,
    this.description,
    this.imageUrl,
    this.posts,
    this.followers,
    this.following,
    this.items,
    this.images,
  });
}

class _Item {
  final String title;
  final String imageUrl;
  _Item({this.title, this.imageUrl});
}
