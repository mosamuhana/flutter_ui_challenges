import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Ecommerce4Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce4/page.dart";

  @override
  _Ecommerce4PageState createState() => _Ecommerce4PageState();
}

class _Ecommerce4PageState extends State<Ecommerce4Page> {
  int currentNavIndex = 1;
  final _searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar,
      backgroundColor: Colors.white70.withOpacity(0.9),
      body: SafeArea(
        child: Stack(
          children: [
            _backContainer1,
            _backContainer2,
            CustomScrollView(
              slivers: [
                _pageHeader,
                _productList,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: currentNavIndex,
      onTap: (i) => setState(() => currentNavIndex = i),
      items: [
        BottomNavigationBarItem(
          icon: _calendarTodayIcon,
          title: Text("Today's Special"),
        ),
        BottomNavigationBarItem(
          icon: _fastfoodIcon,
          title: Text("Foods"),
        ),
        BottomNavigationBarItem(
          icon: _settingsIcon,
          title: Text("Settings"),
        ),
      ],
    );
  }

  Widget get _pageHeader {
    return SliverToBoxAdapter(
      child: Padding(
        padding: _insets26,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning", style: _whiteBold32Style),
            Text("Everyone", style: _whiteBold32Style),
            _hbox40,
            Material(
              elevation: 5,
              borderRadius: _circularBorder30,
              child: TextField(
                controller: _searchController,
                cursorColor: Theme.of(context).primaryColor,
                style: _black18Style,
                decoration: _searchDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _productList {
    return SliverPadding(
      padding: _insets26,
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          _ProductCard(product: _products[0]),
          _ProductCard(product: _products[1]),
          _ProductCard(product: _products[2]),
          _ProductCard(product: _products[3]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _ProductCard extends StatelessWidget {
  final _Product product;

  const _ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: _productCardDecoration,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PNetworkImage(product.image, height: 80),
            _hbox5,
            Text(product.title, style: _bold18Style),
            Container(
              padding: _insets5,
              margin: _insetsT4,
              color: Colors.deepOrange,
              child: Text("\$ ${product.price}", style: _whiteBold12),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _products = <_Product>[
  _Product(id: 1, title: 'Brocoli', price: 30, image: '$STORE_BASE_URL/grocery%2Fbrocoli.png?alt=media'),
  _Product(id: 2, title: 'Cabbage', price: 37, image: '$STORE_BASE_URL/grocery%2Fcabbage.png?alt=media'),
  _Product(id: 3, title: 'Mango', price: 22, image: '$STORE_BASE_URL/grocery%2Fmango.png?alt=media'),
  _Product(id: 4, title: 'Pineapple', price: 90, image: '$STORE_BASE_URL/grocery%2Fpineapple.png?alt=media'),
];

class _Product {
  final int id;
  final String title;
  final String image;
  final double price;
  _Product({this.id, this.title, this.image, this.price});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox5 = SizedBox(height: 5);
const _hbox40 = SizedBox(height: 40);

const _calendarTodayIcon = Icon(Icons.calendar_today);
const _fastfoodIcon = Icon(Icons.fastfood);
const _settingsIcon = Icon(Icons.settings);
const _searchIcon = Icon(Icons.search);

const _whiteBold32Style = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white);
const _black18Style = TextStyle(color: Colors.black, fontSize: 18);
const _bold18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const _whiteBold12 = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);

const _circularRadius30 = Radius.circular(30);
const _circularRadius160 = Radius.circular(160);
const _circularRadius290 = Radius.circular(290);
const _circularRadius10 = Radius.circular(10);

const _circularBorder30 = BorderRadius.all(_circularRadius30);

const _insets26 = EdgeInsets.all(26);
const _insets5 = EdgeInsets.all(5);
const _insetsT4 = EdgeInsets.only(top: 4);
const _insetsH25V13 = EdgeInsets.symmetric(horizontal: 25, vertical: 13);
const _insetsL90B20 = EdgeInsets.only(left: 90, bottom: 20);

final _backContainer1 = Container(
  height: 300,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: _circularRadius30, bottomRight: _circularRadius30),
    color: Colors.orangeAccent.shade700,
  ),
  width: double.infinity,
);

final _backContainer2 = Container(
  margin: _insetsL90B20,
  width: 299,
  height: 279,
  decoration: BoxDecoration(
    color: Colors.orangeAccent.shade400,
    borderRadius: BorderRadius.only(
      topLeft: _circularRadius160,
      bottomLeft: _circularRadius290,
      bottomRight: _circularRadius160,
      topRight: _circularRadius10,
    ),
  ),
);

final _searchDecoration = InputDecoration(
  hintText: 'Search...',
  suffixIcon: Material(
    elevation: 2,
    borderRadius: _circularBorder30,
    child: _searchIcon,
  ),
  border: InputBorder.none,
  contentPadding: _insetsH25V13,
);

final _productCardDecoration = BoxDecoration(
  borderRadius: _circularBorder30,
  boxShadow: [
    BoxShadow(color: Colors.grey, blurRadius: 6),
  ],
  color: Colors.white,
);
