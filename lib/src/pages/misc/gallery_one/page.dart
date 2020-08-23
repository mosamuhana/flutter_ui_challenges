import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/constants.dart';

class GalleryOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/gallery_one/page.dart";

  final List<_ImageTile> tiles;

  GalleryOnePage({Key key})
      : tiles = getTiles(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Photos', style: _blackStyle),
        backgroundColor: Colors.transparent,
        iconTheme: _iconTheme,
        actions: [
          FlatButton(
            textColor: Colors.blue,
            child: Text("Add New"),
            onPressed: () {},
          )
        ],
      ),
      body: StaggeredGridView.countBuilder(
        padding: _insets8,
        crossAxisCount: 3,
        itemCount: 16,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(tiles[index].image),
                fit: BoxFit.cover,
              ),
              borderRadius: _circularBorder10,
            ),
          );
        },
        staggeredTileBuilder: (i) => tiles[i].tile,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }

  final _blackStyle = const TextStyle(color: Colors.black);
  final _iconTheme = IconThemeData(color: Colors.black);
  final _insets8 = EdgeInsets.all(8);
  final _circularBorder10 = BorderRadius.circular(10);
}

class _ImageTile {
  final String image;
  final StaggeredTile tile;
  _ImageTile({this.image, this.tile});
}

const _tile2x2 = StaggeredTile.count(2, 2);
const _tile1x1 = StaggeredTile.count(1, 1);
const _tile2x1 = StaggeredTile.count(2, 1);
const _tile1x2 = StaggeredTile.count(1, 2);

const List<String> _images = [
  '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  '$STORE_BASE_URL/img%2F3.jpg?alt=media',
];

List<_ImageTile> getTiles() {
  int index = 0;
  String getImage() => _images[(index++) % 3];

  return <_ImageTile>[
    _ImageTile(image: getImage(), tile: _tile2x2),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile2x2),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile1x1),
    _ImageTile(image: getImage(), tile: _tile2x1),
    _ImageTile(image: getImage(), tile: _tile1x2),
    _ImageTile(image: getImage(), tile: _tile1x1),
  ];
}
