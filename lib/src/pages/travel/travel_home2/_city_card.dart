import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import '_city.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard({this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _insetsH8,
      child: ClipRRect(
        borderRadius: _circularBorder10,
        child: Stack(
          children: [
            _image,
            _infoBackground,
            _discount,
            _info,
          ],
        ),
      ),
    );
  }

  Widget get _image {
    return Container(
      width: 160,
      height: 210,
      child: PNetworkImage(city.image, fit: BoxFit.cover),
    );
  }

  Widget get _discount {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: _insetsH6V2,
        decoration: _discountDecoration,
        child: Text("${city.discount} %", style: _blackS14Style),
      ),
    );
  }

  Widget get _info {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city.name, style: _whiteW700S16Style),
              Text(city.monthYear, style: _whiteS13Style),
            ],
          ),
        ],
      ),
    );
  }

  final _insetsH8 = EdgeInsets.symmetric(horizontal: 8);
  final _insetsH6V2 = EdgeInsets.symmetric(horizontal: 6, vertical: 2);

  final _blackS14Style = TextStyle(color: Colors.black, fontSize: 14);
  final _whiteW700S16Style = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1);
  final _whiteS13Style = TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.normal);

  final _circularBorder10 = BorderRadius.circular(10);

  final _discountDecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(10),
  );

  final _infoBackground = Positioned(
    left: 0,
    bottom: 0,
    width: 160,
    height: 60,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Colors.black12],
        ),
      ),
    ),
  );
}
