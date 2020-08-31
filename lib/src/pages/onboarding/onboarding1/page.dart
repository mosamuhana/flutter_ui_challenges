import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Onboarding1Page extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/onboarding1/page.dart";

  @override
  _Onboarding1PageState createState() => _Onboarding1PageState();
}

class _Onboarding1PageState extends State<Onboarding1Page> {
  final _swiperController = SwiperController();
  int _currentIndex = 0;

  final _items = <_Item>[
    _Item(
      title: 'Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat.',
      image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    ),
    _Item(
      title: 'Aliquam eget justo \n nec arcu ultricies elementum \n id at metus.',
      image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    ),
    _Item(
      title: 'Nulla facilisi. \nFusce non tempus risus.\n Sed ultrices scelerisque sem,',
      image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    ),
  ];

  bool get canNext => _currentIndex < _items.length - 1;

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Expanded(
            child: Swiper(
              index: _currentIndex,
              controller: _swiperController,
              itemCount: _items.length,
              loop: false,
              pagination: _swiperPagination,
              onIndexChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (_, i) => _buildItem(_items[i]),
            ),
          ),
          _hbox10,
          _bottomButtons,
        ],
      ),
    );
  }

  Widget get _bottomButtons {
    return Container(
      margin: _insetsR16B10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            textColor: Colors.white70,
            child: Text("Skip"),
            onPressed: () => Navigator.of(context).pushReplacementNamed('challenge_home'),
          ),
          IconButton(
            color: Colors.white,
            icon: canNext ? _arrowCircleRightIcon : _checkCircleIcon,
            onPressed: () async {
              if (canNext) {
                _swiperController.next();
              } else {
                Navigator.of(context).pushReplacementNamed('challenge_home');
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildItem(_Item item) {
    return Container(
      width: double.infinity,
      margin: _insetsL16T50R16B40,
      padding: _insets16,
      decoration: BoxDecoration(
        borderRadius: _circularBorder30,
        image: DecorationImage(
          image: NetworkImage(item.image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: _whiteW500S20Style,
          ),
          _hbox30,
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox30 = SizedBox(height: 30);

  final _insetsL16T50R16B40 = EdgeInsets.fromLTRB(16, 50, 16, 40);
  final _insets16 = EdgeInsets.all(16);
  final _insetsR16B10 = EdgeInsets.only(right: 16, bottom: 10);

  final _circularBorder30 = BorderRadius.circular(30);

  final _whiteW500S20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20);

  final _arrowCircleRightIcon = Icon(FontAwesomeIcons.arrowCircleRight, size: 40);
  final _checkCircleIcon = Icon(FontAwesomeIcons.checkCircle, size: 40);

  final _swiperPagination = SwiperPagination(
    builder: CustomPaginationBuilder(
      activeColor: Colors.white,
      activeSize: Size(10, 20),
      size: Size(10, 15),
      color: Colors.grey.shade600,
    ),
  );
}

class _Item {
  final String title;
  final String image;
  _Item({this.title, this.image});
}
