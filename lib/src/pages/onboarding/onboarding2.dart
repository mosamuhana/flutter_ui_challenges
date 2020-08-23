import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class Onboarding2Page extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/onboarding2.dart";

  @override
  _Onboarding2PageState createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
  final _swiperController = SwiperController();
  int _currentIndex = 0;

  final _items = <_Item>[
    _Item(
      title: 'Lorem ipsum dolor \nsit amet, consectetur adipiscing \n elit placerat.',
      image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
      color: Colors.blue.shade300,
    ),
    _Item(
      title: 'Aliquam eget justo \n nec arcu ultricies elementum \n id at metus.',
      image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
      color: Colors.grey.shade600,
    ),
    _Item(
      title: 'Nulla facilisi. \nFusce non tempus risus.\n Sed ultrices scelerisque sem,',
      image: '$STORE_BASE_URL/img%2F5.jpg?alt=media',
      color: Colors.cyan.shade300,
    ),
  ];

  bool get canNext => _currentIndex < _items.length - 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 300,
              margin: _insetsH8,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: _circularBorder5,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Swiper(
                  index: _currentIndex,
                  controller: _swiperController,
                  itemCount: _items.length,
                  onIndexChanged: (i) => setState(() => _currentIndex = i),
                  loop: false,
                  itemBuilder: (_, i) => _buildItem(_items[i]),
                  pagination: SwiperPagination(
                    builder: CustomPaginationBuilder(
                      activeSize: Size(10, 20),
                      size: Size(10, 15),
                      color: Colors.grey.shade600,
                    ),
                  ),
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
      margin: _insetsR16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            textColor: Colors.grey.shade600,
            child: Text("Skip"),
            onPressed: () => Navigator.of(context).pushReplacementNamed('challenge_home'),
          ),
          IconButton(
            icon: canNext ? _arrowForwardIosIcon : _checkIcon,
            onPressed: () {
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
        color: item.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _hbox20,
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: _whiteW500S20Style,
          ),
          _hbox30,
          Expanded(
            child: ClipOval(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          _hbox50,
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
  final _hbox50 = SizedBox(height: 50);

  final _insetsL16T50R16B40 = EdgeInsets.fromLTRB(16, 50, 16, 40);
  final _insetsH8 = EdgeInsets.symmetric(horizontal: 8);
  final _insetsR16 = EdgeInsets.only(right: 16);
  final _insets16 = EdgeInsets.all(16);

  final _circularBorder30 = BorderRadius.circular(30);
  final _circularBorder5 = BorderRadius.circular(5);

  final _whiteW500S20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20);

  final _arrowForwardIosIcon = Icon(Icons.arrow_forward_ios);
  final _checkIcon = Icon(FontAwesomeIcons.check);
}

class _Item {
  final String title;
  final String image;
  final Color color;
  _Item({this.title, this.image, this.color});
}
