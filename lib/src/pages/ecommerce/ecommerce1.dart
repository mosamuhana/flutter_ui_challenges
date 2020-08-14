import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

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
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _body {
    return SafeArea(
      child: ListView(
        children: [
          _imageListSlider,
          _categoriesList,
          _flashSales,
          _popularList,
          Center(child: Text('Just for You', style: _bold20Style)),
          _buildTopItems(0),
          _buildTopItems(2),
          _buildTopItems(4),
          _buildTopItems(6),
          _buildTopItems(8),
        ],
      ),
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

  Widget get _imageListSlider {
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
          ImageListSlider(images: images, padding: _insetsSymmetricH20),
        ],
      ),
    );
  }

  Widget get _categoriesList {
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
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () => print(categories[i]),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  maxRadius: 30,
                  child: _whiteHomeIcon,
                ),
                _hbox8,
                Text(categories[i % categories.length])
              ],
            ),
          );
        },
      ),
    );
  }

  Widget get _flashSales {
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
                  Text('Flash Sales', style: _boldStyle),
                  _wbox10,
                  Container(
                    color: Colors.black,
                    padding: _insetsSymmetricH5V2,
                    child: Text('02', style: _whiteStyle),
                  ),
                  _wbox5,
                  Container(
                    color: Colors.black,
                    padding: _insetsSymmetricH5V2,
                    child: Text('20', style: _whiteStyle),
                  ),
                  _wbox5,
                  Container(
                    color: Colors.black,
                    padding: _insetsSymmetricH5V2,
                    child: Text('30', style: _whiteStyle),
                  ),
                ],
              ),
              Text('SHOP MORE >>', style: _redStyle)
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

  Widget _buildTopItem(int index) {
    final item = _topItems[index % _topItems.length];
    return Expanded(
      child: Column(
        children: [
          PNetworkImage(item.image),
          _hbox10,
          Text(item.title, softWrap: true),
          _hbox10,
          Text(item.price, style: _redBold18Style)
        ],
      ),
    );
  }

  Widget _buildTopItems(int index) {
    return Container(
      padding: _insetsSymmetricH10V5,
      child: Row(
        children: [
          _buildTopItem(index),
          _wbox10,
          _buildTopItem(index + 1),
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
                  clipper: _shapeClipper,
                  child: Container(height: 20, color: Colors.red.shade200),
                ),
                ClipPath(
                  clipper: _shapeClipper,
                  child: Container(
                    padding: _insetsL10,
                    height: 20,
                    width: 70,
                    color: Colors.red,
                    child: Text('12 Sold', style: _whiteStyle),
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

final _topItems = <_TopItem>[
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F4.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  ),
  _TopItem(
    title: 'Top Quality fashion item',
    price: 'Rs.1,254',
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
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

class _TopItem {
  final String title;
  final String price;
  final String image;
  _TopItem({this.title, this.price, this.image});
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

const _redBorderSide = BorderSide(width: 1, style: BorderStyle.solid, color: Colors.red);
const _shapeClipper = ShapeBorderClipper(shape: StadiumBorder(side: _redBorderSide));
