import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class Onboarding5Page extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/onboarding5.dart";

  @override
  _Onboarding5PageState createState() => _Onboarding5PageState();
}

class _Onboarding5PageState extends State<Onboarding5Page> {
  final _controller = SwiperController();
  int _currentIndex = 0;

  final _items = <_Item>[
    _Item(
      title: 'Welcome',
      subtitle: 'Welcome to this awesome intro screen app',
      image: '$STORE_BASE_URL/intro%2F1.png?alt=media',
      color: Colors.green.shade300,
    ),
    _Item(
      title: 'Awesome App',
      subtitle: 'This is an awesome app, of intro screen design',
      image: '$STORE_BASE_URL/intro%2F2.png?alt=media',
      color: Colors.blue.shade300,
    ),
    _Item(
      title: 'Flutter App',
      subtitle: 'Flutter is awesome for app development',
      image: '$STORE_BASE_URL/intro%2F3.png?alt=media',
      color: Colors.indigo.shade300,
    ),
  ];

  bool get canForward => _currentIndex < _items.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (i) => setState(() => _currentIndex = i),
            controller: _controller,
            pagination: _swiperPagination,
            itemCount: _items.length,
            itemBuilder: (_, i) => _IntroItem(item: _items[i]),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              child: Text("Skip"),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: canForward ? _arrowForwardIcon : _checkIcon,
              onPressed: () {
                if (canForward) {
                  _controller.next();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  final _checkIcon = Icon(Icons.check);
  final _arrowForwardIcon = Icon(Icons.arrow_forward);

  final _swiperPagination = SwiperPagination(
    builder: DotSwiperPaginationBuilder(
      activeColor: Colors.red,
      activeSize: 20,
    ),
  );
}

class _IntroItem extends StatelessWidget {
  final _Item item;

  _IntroItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.color ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: _insets16,
          child: Column(
            children: [
              _hbox40,
              Text(item.title, style: _whiteBoldS35Style),
              if (item.subtitle != null) ...[
                _hbox20,
                Text(
                  item.subtitle,
                  style: _whiteS24Style,
                  textAlign: TextAlign.center,
                ),
              ],
              _hbox40,
              Expanded(
                child: Container(
                  margin: _insetsB70,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: _circularBorder20,
                    child: Material(
                      elevation: 4,
                      child: PNetworkImage(item.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);
  final _hbox40 = SizedBox(height: 40);

  final _insets16 = EdgeInsets.all(16);
  final _insetsB70 = EdgeInsets.only(bottom: 70);

  final _circularBorder20 = BorderRadius.circular(20);

  final _whiteBoldS35Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35);
  final _whiteS24Style = TextStyle(color: Colors.white, fontSize: 24);
}

class _Item {
  final String title;
  final String subtitle;
  final String image;
  final Color color;
  _Item({this.title, this.subtitle, this.image, this.color});
}
