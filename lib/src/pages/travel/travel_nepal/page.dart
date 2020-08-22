import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class TravelNepalPage extends StatefulWidget {
  static final String path = "lib/src/pages/travel/travel_nepal/page.dart";

  @override
  _TravelNepalPageState createState() => _TravelNepalPageState();
}

class _TravelNepalPageState extends State<TravelNepalPage> {
  final _images = <String>[_fewalake, _kathmandu1, _fishtail, _mountEverest, _kathmandu2];
  final _tags = <String>['Pokhara', 'Everest base camp', 'Lumbini', 'Annapurna', 'Kathmandu', '10+'];

  int _selectedTag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_mountEverest),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
          ),
          ListView(
            children: [
              _hbox100,
              Text(
                'DISCOVER NEPAL',
                textAlign: TextAlign.center,
                style: _whiteS24Style,
              ),
              Text(
                "Heaven is myth. Nepal is real.",
                textAlign: TextAlign.center,
                style: _whiteStyle,
              ),
              _hbox50,
              _imageSwiper,
              _frequentlySearched,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _imageSwiper {
    final children = _images
        .map(
          (image) => Container(
            child: ClipRRect(
              borderRadius: _circularBorder5,
              child: PNetworkImage(image, fit: BoxFit.cover),
            ),
          ),
        )
        .toList();

    return Container(
      padding: _insets20,
      child: Material(
        elevation: 5,
        child: Container(
          padding: _insets16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TOP RATED'),
              Text("Sort by price"),
              _hbox20,
              Container(
                height: 200,
                child: Swiper.children(
                  autoplay: true,
                  loop: true,
                  pagination: _swiperPagination,
                  control: _swiperControl,
                  children: children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _frequentlySearched {
    Widget createTag(int index) {
      var selected = _selectedTag == index;
      return InkWell(
        onTap: () => setState(() => _selectedTag = index),
        child: Chip(
          backgroundColor: selected ? Colors.red : null,
          label: Text(_tags[index].toUpperCase(), style: selected ? _whiteStyle : null),
        ),
      );
    }

    return Container(
      padding: _insets20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FREQUENTLY SEARCHED'),
          _hbox10,
          Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 5,
            children: [
              ..._tags.asMap().keys.map((index) => createTag(index)),
            ],
          ),
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox50 = SizedBox(height: 50);
  final _hbox100 = SizedBox(height: 100);

  final _whiteS24Style = TextStyle(fontSize: 24, color: Colors.white);
  final _whiteStyle = TextStyle(color: Colors.white);

  final _insets16 = EdgeInsets.all(16);
  final _insets20 = EdgeInsets.all(20);

  final _circularBorder5 = BorderRadius.circular(5);

  final _swiperPagination = SwiperPagination(
    margin: EdgeInsets.only(right: 25),
    builder: DotSwiperPaginationBuilder(color: Colors.grey),
  );

  final _swiperControl = SwiperControl(
    iconNext: Icons.arrow_forward_ios,
    iconPrevious: Icons.arrow_back_ios,
  );
}

const String _mountEverest = '$STORE_BASE_URL/travel%2Fmount_everest.jpg?alt=media';
const String _fewalake = '$STORE_BASE_URL/travel%2Ffewalake.jpg?alt=media';
const String _kathmandu1 = '$STORE_BASE_URL/travel%2Fkathmandu1.jpg?alt=media';
const String _kathmandu2 = '$STORE_BASE_URL/travel%2Fkathmandu2.jpg?alt=media';
const String _fishtail = '$STORE_BASE_URL/travel%2Ffishtail.jpg?alt=media';
