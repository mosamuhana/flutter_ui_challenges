import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';
import '../../../core/widgets.dart';

final _profile = _Profile(
  name: 'Damodar Lohani',
  jobDescription: 'Flutter & Full Stack Developer',
  avatar: '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
  panner: '$STORE_BASE_URL/food%2Fpancake.jpg?alt=media',
  favorites: [
    _Favorite(title: "Design", image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
    _Favorite(title: "Fruits", image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
    _Favorite(title: "Nature", image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
  ],
  friends: [
    '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    '$STORE_BASE_URL/img%2F4.jpg?alt=media',
    '$STORE_BASE_URL/img%2F6.jpg?alt=media',
    '$STORE_BASE_URL/img%2F7.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fdev_sudip.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fdev_sid.png?alt=media',
  ],
);

class ProfileNinePage extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile9.dart";

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _backHeader(),
          _backHeaderImage(),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              Avatar(image: _profile.avatar, size: 160, borderColor: Colors.white, borderWidth: 2),
              hSizedBox10,
              Text(
                _profile.name,
                style: t.headline6.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              hSizedBox5,
              Text(
                _profile.jobDescription,
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              hSizedBox10,
              _countersCard(context),
              hSizedBox20,
              Text("Favorite", style: t.headline5),
              hSizedBox10,
              _buildFavorites(context),
              hSizedBox20,
              Text("Friends", style: t.headline5),
              Container(
                height: 60,
                width: double.infinity,
                child: Stack(children: _buildFriendList()),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {},
      ),
    );
  }

  Widget _buildFavorites(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var f in _profile.favorites) ...[
            _FavoriteCard(title: f.title, image: f.image),
            wSizedBox10,
          ],
        ],
      ),
    );
  }

  List<Widget> _buildFriendList() {
    Widget transform(int i, String image) {
      return Transform.translate(
        offset: Offset(i * 30.0, 0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: Avatar(image: image, size: 60, borderColor: Colors.white, borderWidth: 2),
        ),
      );
    }

    return _profile.friends.asMap().map((i, image) => MapEntry(i, transform(i, image))).values.toList();
  }

  Widget _backHeader() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        height: 380,
        decoration: BoxDecoration(color: Colors.pink),
      ),
    );
  }

  Widget _backHeaderImage() {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: 380,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(_profile.panner), fit: BoxFit.cover),
        ),
        foregroundDecoration: BoxDecoration(color: Colors.pink.withOpacity(0.8)),
      ),
    );
  }

  Widget _countersCard(BuildContext context) {
    final t = Theme.of(context).textTheme;
    Widget _counter(String name, String value) {
      return Expanded(
        child: Column(
          children: [
            Text(value, style: t.headline4),
            hSizedBox10,
            Text(name, style: t.subtitle1),
          ],
        ),
      );
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _counter('Followers', '255K'),
            _counter('Following', '105K'),
          ],
        ),
      ),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  final String title;
  final String image;

  const _FavoriteCard({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(10.0)),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(10.0)),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0),
            ),
            foregroundDecoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _Profile {
  final String name;
  final String jobDescription;
  final String avatar;
  final String panner;
  final List<_Favorite> favorites;
  final List<String> friends;
  _Profile({
    this.name,
    this.jobDescription,
    this.avatar,
    this.panner,
    this.favorites,
    this.friends,
  });
}

class _Favorite {
  final String title;
  final String image;
  _Favorite({this.title, this.image});
}
