import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class SlidersPage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliders/page.dart";

  final List<String> images = _images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _slider1,
            _hbox20,
            _slider2,
            _hbox20,
            _slider3,
          ],
        ),
      ),
    );
  }

  Widget get _slider1 {
    return Container(
      height: 300,
      color: Colors.grey.shade800,
      padding: _insets16,
      child: Swiper(
        itemCount: 10,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: SwiperPagination(),
        itemBuilder: (_, i) {
          return ClipRRect(
            borderRadius: _circularBorder10,
            child: PNetworkImage(images[i], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Widget get _slider2 {
    return Container(
      height: 300,
      color: Colors.grey.shade800,
      padding: _insets16,
      child: Swiper(
        itemWidth: 300,
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemBuilder: (_, i) {
          return ClipRRect(
            borderRadius: _circularBorder10,
            child: PNetworkImage(images[i], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Widget get _slider3 {
    return Container(
      height: 340,
      color: Colors.grey.shade800,
      padding: _insets16,
      child: Swiper(
        fade: 0,
        itemBuilder: (_, i) {
          return Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: _circularTopBorder10,
                  image: DecorationImage(image: NetworkImage(images[i]), fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: _circularBottomBorder10,
                ),
                child: ListTile(
                  subtitle: Text("awesome image caption"),
                  title: Text("Awesome image"),
                ),
              )
            ],
          );
        },
        itemCount: 10,
        scale: 0.9,
        pagination: SwiperPagination(),
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);

  final _insets16 = EdgeInsets.all(16);

  final _circularBorder10 = BorderRadius.circular(10);
  final _circularTopBorder10 = BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
  final _circularBottomBorder10 = BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
}

final List<String> _images = [
  '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  '$STORE_BASE_URL/food%2Fbreakfast.jpg?alt=media',
  '$STORE_BASE_URL/travel%2Ffishtail.jpg?alt=media',
  '$STORE_BASE_URL/img%2F6.jpg?alt=media',
  '$STORE_BASE_URL/food%2Fpancake.jpg?alt=media',
  '$STORE_BASE_URL/travel%2Ffewalake.jpg?alt=media',
  '$STORE_BASE_URL/img%2F7.jpg?alt=media',
  '$STORE_BASE_URL/food%2Ffries.jpg?alt=media',
  '$STORE_BASE_URL/travel%2Fkathmandu1.jpg?alt=media',
  '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
  '$STORE_BASE_URL/travel%2Fpashupatinath.jpg?alt=media',
];
