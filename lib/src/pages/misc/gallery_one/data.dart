import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/constants.dart';
import 'models.dart';

List<ImageTile> getTiles() {
  const _tile2x2 = StaggeredTile.count(2, 2);
  const _tile1x1 = StaggeredTile.count(1, 1);
  const _tile2x1 = StaggeredTile.count(2, 1);
  const _tile1x2 = StaggeredTile.count(1, 2);

  const List<String> _images = [
    '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    '$STORE_BASE_URL/img%2F3.jpg?alt=media',
  ];

  int index = 0;
  String getImage() => _images[(index++) % 3];

  return <ImageTile>[
    ImageTile(image: getImage(), tile: _tile2x2),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile2x2),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile1x1),
    ImageTile(image: getImage(), tile: _tile2x1),
    ImageTile(image: getImage(), tile: _tile1x2),
    ImageTile(image: getImage(), tile: _tile1x1),
  ];
}
