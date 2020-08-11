part of '../profile6.dart';

class _Developer {
  final String firstName;
  final String lastName;
  final String avatar;
  final String backdropPhoto;
  final String location;
  final String biography;
  final List<_Video> videos;

  _Developer({
    @required this.firstName,
    @required this.lastName,
    @required this.avatar,
    @required this.backdropPhoto,
    @required this.location,
    @required this.biography,
    @required this.videos,
  });

  String get name => '$firstName $lastName';
}

class _Video {
  final String title;
  final String thumbnail;
  final String url;

  _Video({
    @required this.title,
    @required this.thumbnail,
    @required this.url,
  });
}

const _base = 'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o';

final _dev = _Developer(
  firstName: 'Cimple',
  lastName: 'Sid',
  avatar: '$_base/img%2Fdev_sid.png?alt=media',
  backdropPhoto: '$_base/img%2Fbackdrop.png?alt=media',
  location: 'Mahendranagar, Nepal',
  biography: 'Siddhartha  Joshi is a Flutter dev  '
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.  '
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  videos: <_Video>[
    _Video(
      title: 'WIFI hacking part 1',
      thumbnail: '$_base/img%2Fvideo1_thumb.png?alt=media',
      url: 'https://www.youtube.com/watch?v=06qoTsKYWKE',
    ),
    _Video(
      title: 'WIFI hacking part 2',
      thumbnail: '$_base/img%2Fvideo2_thumb.png?alt=media',
      url: 'https://www.youtube.com/watch?v=3XG4c5_mGCM',
    ),
    _Video(
      title: 'WIFI hacking part 3',
      thumbnail: '$_base/img%2Fvideo3_thumb.png?alt=media',
      url: 'https://www.youtube.com/watch?v=C29QstsxWQE',
    ),
    _Video(
      title: 'Find facebook users location',
      thumbnail: '$_base/img%2Fvideo4_thumb.png?alt=media',
      url: 'https://www.youtube.com/watch?v=J9zhKtL_gH0',
    ),
  ],
);
