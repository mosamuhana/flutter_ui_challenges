import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Onboarding3Page extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/onboarding3/page.dart";

  @override
  _Onboarding3PageState createState() => _Onboarding3PageState();
}

class _Onboarding3PageState extends State<Onboarding3Page> {
  final _swiperController = SwiperController();
  final int _pageCount = 3;
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
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: PNetworkImage(
              _backgroundImage,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Swiper(
                  index: _currentIndex,
                  controller: _swiperController,
                  itemCount: _pageCount,
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
            textColor: Colors.grey.shade700,
            child: Text("Skip"),
            onPressed: () => Navigator.of(context).pushReplacementNamed('challenge_home'),
          ),
          IconButton(
            icon: canNext ? _arrowCircleRightIcon : _checkCircleIcon,
            onPressed: () async {
              if (canNext) {
                _swiperController.next();
              } else {
                Navigator.of(context).pushReplacementNamed('challenge_home');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem(_Item item) {
    return Container(
      width: double.infinity,
      margin: _insets50,
      padding: _insets16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(item.image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply),
        ),
        boxShadow: [_shadow1],
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

  final _insets16 = EdgeInsets.all(16);
  final _insets50 = EdgeInsets.all(50);
  final _insetsR16B10 = EdgeInsets.only(right: 16, bottom: 10);

  final _whiteW500S20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20);

  final _arrowCircleRightIcon = Icon(FontAwesomeIcons.arrowCircleRight, size: 40);
  final _checkCircleIcon = Icon(FontAwesomeIcons.checkCircle, size: 40);

  final _shadow1 = BoxShadow(blurRadius: 10, spreadRadius: 5, offset: Offset(5, 5), color: Colors.black26);

  final _swiperPagination = SwiperPagination(
    builder: CustomPaginationBuilder(
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

const _backgroundImage = '$STORE_BASE_URL/img%2Fphotographer.jpg?alt=media';
