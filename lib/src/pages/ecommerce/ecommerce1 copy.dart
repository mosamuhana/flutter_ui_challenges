import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class EcommerceOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce1.dart";

  @override
  _EcommerceOnePageState createState() => _EcommerceOnePageState();
}

class _EcommerceOnePageState extends State<EcommerceOnePage> {
  int currentNavIndex = 0;

  final List<String> categories = [
    'DarazMall',
    'Flash Sales',
    'Collection',
    'Vouchers',
    'Categories',
  ];

  final List<String> images = [
    '$STORE_BASE_URL/img%2F1.jpg?alt=media',
    '$STORE_BASE_URL/img%2F3.jpg?alt=media',
    '$STORE_BASE_URL/img%2F2.jpg?alt=media',
    '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  ];

  final List<String> flashSaleImages = [
    '$STORE_BASE_URL/img%2Fb1.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fb3.jpg?alt=media',
    '$STORE_BASE_URL/img%2Fb2.jpg?alt=media',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Flutter UIs'),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: _buildListView,
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: currentNavIndex,
      onTap: (index) {
        print('NavItem: $index');
        if (currentNavIndex != index) {
          setState(() => currentNavIndex = index);
        }
      },
      items: [
        for (var item in _navItems)
          BottomNavigationBarItem(
            icon: item.icon,
            title: Text(item.title),
          ),
      ],
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
    );
  }

  Widget _buildListView(_, index) {
    if (index == 0) return _buildSlider();
    if (index == 1) return _buildCategoriesGrid();
    if (index == 2) return _buildFlashSales();
    if (index == 3) return _popularList;
    if (index == 4) return Center(child: Text('Just for You', style: _bold20Style));
    return Container(
      padding: _insetsSymmetricH10V5,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                PNetworkImage(images[index % images.length]),
                _hbox10,
                Text('Top Quality fashion item', softWrap: true),
                _hbox10,
                Text('Rs.1,254', style: _redBold18Style)
              ],
            ),
          ),
          _wbox10,
          Expanded(
            child: Column(
              children: [
                PNetworkImage(images[(index - 1) % images.length]),
                _hbox10,
                Text('Top Quality fashion item', softWrap: true),
                _hbox10,
                Text('Rs.1,254', style: _redBold18Style)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _popularList {
    return Container(
      height: 180,
      child: Column(
        children: [
          Container(
            padding: _insetsAll10,
            child: Row(
              children: [
                _PopularItemWidget(item: _popularItems[0]),
                _wbox10,
                _PopularItemWidget(item: _popularItems[1]),
              ],
            ),
          ),
          Container(
            padding: _insetsAll10,
            child: Row(
              children: [
                _PopularItemWidget(item: _popularItems[2]),
                _wbox10,
                _PopularItemWidget(item: _popularItems[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSales() {
    return Container(
      height: 200,
      padding: _insetsAll10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Flash Sales',
                    style: _boldStyle,
                  ),
                  _wbox10,
                  Container(
                    color: Colors.black,
                    padding: _insetsSymmetricH5V2,
                    child: Text(
                      '02',
                      style: _whiteStyle,
                    ),
                  ),
                  _wbox5,
                  Container(
                    color: Colors.black,
                    padding: _insetsSymmetricH5V2,
                    child: Text(
                      '20',
                      style: _whiteStyle,
                    ),
                  ),
                  _wbox5,
                  Container(
                    color: Colors.black,
                    padding: _insetsSymmetricH5V2,
                    child: Text(
                      '30',
                      style: _whiteStyle,
                    ),
                  ),
                ],
              ),
              Text(
                'SHOP MORE >>',
                style: _redStyle,
              )
            ],
          ),
          _hbox10,
          Row(
            children: [
              _buildFlashSaleItem(0),
              _buildFlashSaleItem(1),
              _buildFlashSaleItem(2),
            ],
          )
        ],
      ),
    );
  }

  Expanded _buildFlashSaleItem(int index) {
    return Expanded(
      child: Container(
        padding: _insetsAll5,
        child: Column(
          children: [
            Container(
              height: 80,
              // color: Colors.blue,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(flashSaleImages[index]), fit: BoxFit.cover),
              ),
            ),
            _hbox5,
            Stack(
              children: [
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: StadiumBorder(
                      side: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.red),
                    ),
                  ),
                  child: Container(
                    height: 20,
                    color: Colors.red.shade200,
                  ),
                ),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: StadiumBorder(
                      side: BorderSide(width: 1, style: BorderStyle.solid, color: Colors.red),
                    ),
                  ),
                  child: Container(
                    padding: _insetsL10,
                    height: 20,
                    width: 70,
                    color: Colors.red,
                    child: Text(
                      '12 Sold',
                      style: _whiteStyle,
                    ),
                  ),
                ),
              ],
            ),
            _hbox5,
            Text('Rs.275')
          ],
        ),
      ),
    );
  }

  Widget _buildSlider() {
    return Container(
      height: 120,
      child: Stack(
        children: [
          ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 110,
              color: Colors.deepPurple,
            ),
          ),
          Container(
            padding: _insetsSymmetricH20,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return PNetworkImage(images[index], fit: BoxFit.cover);
              },
              itemCount: 4,
              pagination: SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Container(
      height: 110,
      child: GridView.builder(
        padding: _insetsAll10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () => print(categories[index]),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  maxRadius: 30,
                  child: _whiteHomeIcon,
                ),
                _hbox8,
                Text(categories[index % categories.length])
              ],
            ),
          );
        },
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _PopularItemWidget extends StatelessWidget {
  final _PopularItem item;

  const _PopularItemWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(
            left: BorderSide(color: Colors.red.shade200, style: BorderStyle.solid, width: 5),
          ),
        ),
        child: ListTile(
          onTap: () {},
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          trailing: Container(
            width: 50,
            child: PNetworkImage(item.image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class _ImageSlides extends StatelessWidget {
  final List<String> images;

  const _ImageSlides({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Stack(
        children: [
          ClipPath(
            clipper: DiagonalPathClipperOne(),
            child: Container(
              height: 110,
              color: Colors.deepPurple,
            ),
          ),
          Container(
            padding: _insetsSymmetricH20,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return PNetworkImage(images[index], fit: BoxFit.cover);
              },
              itemCount: 4,
              pagination: SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _navItems = <_NavItem>[
  _NavItem(id: 'home', title: 'Home', icon: _homeIcon),
  _NavItem(id: 'messages', title: 'Messages', icon: _messageIcon),
  _NavItem(id: 'cart', title: 'Cart', icon: _shoppingCartIcon),
  _NavItem(id: 'account', title: 'Account', icon: _personIcon),
];

final _popularItems = [
  _PopularItem(
    title: 'Vehicles',
    subtitle: '120 people want this',
    image: _backgroundImageUrl,
  ),
  _PopularItem(
    title: 'Vehicles',
    subtitle: '120 people want this',
    image: _backgroundImageUrl,
  ),
  _PopularItem(
    title: 'Vehicles',
    subtitle: '120 people want this',
    image: _backgroundImageUrl,
  ),
  _PopularItem(
    title: 'Vehicles',
    subtitle: '120 people want this',
    image: _backgroundImageUrl,
  ),
];

class _NavItem {
  final String id;
  final String title;
  final Widget icon;
  _NavItem({this.id, this.title, this.icon});
}

class _PopularItem {
  final String title;
  final String subtitle;
  final String image;
  _PopularItem({this.title, this.subtitle, this.image});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _backgroundImageUrl = '$STORE_BASE_URL/img%2Fb2.jpg?alt=media';

const _hbox5 = SizedBox(height: 5);
const _hbox8 = SizedBox(height: 8);
const _hbox10 = SizedBox(height: 10);
const _wbox5 = SizedBox(width: 5);
const _wbox10 = SizedBox(width: 10);

const _homeIcon = Icon(Icons.home);
const _messageIcon = Icon(Icons.message);
const _shoppingCartIcon = Icon(Icons.shopping_cart);
const _personIcon = Icon(Icons.person);
const _whiteHomeIcon = Icon(Icons.home, color: Colors.white);

const _bold20Style = TextStyle(fontWeight: FontWeight.w700, fontSize: 20);
const _redBold18Style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red);
const _boldStyle = TextStyle(fontWeight: FontWeight.bold);
const _whiteStyle = TextStyle(color: Colors.white);
const _redStyle = TextStyle(color: Colors.red);

const _insetsSymmetricH10V5 = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
const _insetsSymmetricH5V2 = EdgeInsets.symmetric(vertical: 2, horizontal: 5);
const _insetsAll10 = EdgeInsets.all(10);
const _insetsAll5 = EdgeInsets.all(5);
const _insetsL10 = EdgeInsets.only(left: 10);
const _insetsSymmetricH20 = EdgeInsets.symmetric(horizontal: 20);
