import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'models.dart';

class Profile9Page extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile9/page.dart";

  final profile = Profile(
    name: 'Damodar Lohani',
    jobDescription: 'Flutter & Full Stack Developer',
    avatar: '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
    panner: '$STORE_BASE_URL/food%2Fpancake.jpg?alt=media',
    favorites: [
      Favorite(title: "Design", image: '$STORE_BASE_URL/img%2F1.jpg?alt=media'),
      Favorite(title: "Fruits", image: '$STORE_BASE_URL/img%2F2.jpg?alt=media'),
      Favorite(title: "Nature", image: '$STORE_BASE_URL/img%2F3.jpg?alt=media'),
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
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: _insetsT30,
              height: 380,
              decoration: BoxDecoration(color: Colors.pink),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(profile.panner), fit: BoxFit.cover),
              ),
              foregroundDecoration: BoxDecoration(color: Colors.pink.withOpacity(0.8)),
            ),
          ),
          ListView(
            padding: _insets8,
            children: [
              _hbox90,
              Avatar(image: profile.avatar, size: 160, borderColor: Colors.white, borderWidth: 2),
              _hbox10,
              Text(
                profile.name,
                style: t.headline6.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              _hbox5,
              Text(
                profile.jobDescription,
                style: _white70Style,
                textAlign: TextAlign.center,
              ),
              _hbox10,
              _countersCard(context),
              _hbox20,
              Text("Favorite", style: t.headline5),
              _hbox10,
              _buildFavorites(context),
              _hbox20,
              Text("Friends", style: t.headline5),
              Container(
                height: 60,
                width: double.infinity,
                child: Stack(
                  children: List.generate(profile.friends.length, (i) {
                    return Transform.translate(
                      offset: Offset(i * 30.0, 0),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Avatar(image: profile.friends[i], size: 60, borderColor: Colors.white, borderWidth: 2),
                      ),
                    );
                  }).toList(),
                ),
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
          for (var f in profile.favorites) ...[
            _buildFavoriteItem(context, f),
            _wbox10,
          ],
        ],
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
            _hbox10,
            Text(name, style: t.subtitle1),
          ],
        ),
      );
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: _insetsH32V8,
      shape: _countersShape,
      child: Padding(
        padding: _insets16,
        child: Row(
          children: [
            _counter('Followers', '255K'),
            _counter('Following', '105K'),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(BuildContext context, Favorite f) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          _back1,
          _back2,
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: _insetsB16,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(f.image), fit: BoxFit.cover),
              borderRadius: _circularBorder10,
            ),
            foregroundDecoration: _foregroundDecoration,
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: _insetsB20,
            child: Text(
              f.title,
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  final _wbox10 = SizedBox(width: 10);
  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox90 = SizedBox(height: 90);

  final _insetsH32V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 32);
  final _insetsT30 = EdgeInsets.only(top: 30);
  final _insetsB16 = EdgeInsets.only(bottom: 16);
  final _insetsB20 = EdgeInsets.only(bottom: 20);
  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);

  final _white70Style = TextStyle(color: Colors.white70);

  final _circularBorder10 = BorderRadius.circular(10);

  final _countersShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  final _foregroundDecoration = BoxDecoration(
    color: Colors.blue.withOpacity(0.3),
    borderRadius: BorderRadius.circular(10),
  );

  final _back1 = Container(
    decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
    height: double.infinity,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 8),
  );

  final _back2 = Container(
    decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
    height: double.infinity,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
  );
}
