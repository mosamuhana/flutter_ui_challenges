import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'p_network_image.dart';

class ImageListSlider extends StatelessWidget {
  final List<String> images;
  final EdgeInsetsGeometry padding;

  const ImageListSlider({Key key, this.images, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Swiper(
        autoplay: true,
        itemBuilder: (_, i) => PNetworkImage(images[i], fit: BoxFit.cover),
        itemCount: images.length,
        pagination: SwiperPagination(),
      ),
    );
  }
}
