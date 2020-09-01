import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/widgets.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;

  ImageSlider({Key key, @required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _insetsB20,
      height: 200,
      child: Container(
        child: Swiper(
          autoplay: true,
          itemBuilder: (context, index) => CustomImage(images[index], fit: BoxFit.cover),
          itemCount: images.length,
          pagination: SwiperPagination(),
        ),
      ),
    );
  }

  final _insetsB20 = EdgeInsets.only(bottom: 20);
}
