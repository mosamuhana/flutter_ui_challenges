import 'package:flutter/material.dart';

import '../../../core/res/assets.dart';
import '../../../core/widgets.dart';
import 'tabs/grocery_cart_tabview.dart';
import 'tabs/grocery_home_tabview.dart';
import 'tabs/grocery_profile_tabview.dart';
import 'tabs/grocery_wishlist_tabview.dart';

class GroceryHomePage extends StatefulWidget {
  static final String path = "lib/src/pages/grocery/ghome.dart";

  @override
  GroceryHomePageState createState() => GroceryHomePageState();
}

class GroceryHomePageState extends State<GroceryHomePage> {
  int currentIndex = 0;
  List<_PageData> pageDataList;
  List<BottomNavigationBarItem> navItems;

  _PageData get currentPageData => pageDataList[currentIndex];

  @override
  void initState() {
    pageDataList = [
      _PageData(
        appBar: _homeAppBar,
        content: GroceryHomeTabView(),
      ),
      _PageData(
        appBar: _buildAppBar("Your Cart"),
        content: GroceryCartTabView(),
      ),
      _PageData(
        appBar: _buildAppBar("Your Wishlist"),
        content: GroceryWishlistTabView(),
      ),
      _PageData(
        appBar: _buildAppBar("You"),
        content: GroceryProfileTabView(),
      ),
    ];

    navItems = [
      BottomNavigationBarItem(icon: _homeIcon, label: "Home"),
      BottomNavigationBarItem(icon: _shoppingCartIcon, label: "Cart"),
      BottomNavigationBarItem(icon: _favoriteBorderIcon, label: "Wishlist"),
      BottomNavigationBarItem(icon: _personOutlineIcon, label: "You"),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var current = currentPageData;
    return Scaffold(
      appBar: current.appBar,
      body: current.content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => setState(() => currentIndex = i),
        items: navItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
      ),
    );
  }

  Widget get _homeAppBar {
    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: Container(
        margin: _insetsT20,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            child: Card(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: _insetsH20V15,
                    hintText: "Search products",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: _searchIcon,
                    ),
                  ),
                ),
              ),
            ),
          ),
          leading: PNetworkImage(deliveryIcon),
        ),
      ),
    );
  }

  Widget _buildAppBar(String title) {
    return AppBar(
      bottom: _appBarBottom,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(title, style: _blackStyle),
    );
  }

  final _blackStyle = TextStyle(color: Colors.black);

  final _insetsT20 = EdgeInsets.only(top: 20);
  final _insetsH20V15 = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

  final _searchIcon = Icon(Icons.search);
  final _homeIcon = Icon(Icons.home);
  final _shoppingCartIcon = Icon(Icons.shopping_cart);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _personOutlineIcon = Icon(Icons.person_outline);

  final _appBarBottom = PreferredSize(
    child: Container(color: Colors.grey.shade200, height: 1),
    preferredSize: Size.fromHeight(1),
  );
}

class _PageData {
  final Widget appBar;
  final Widget content;
  _PageData({@required this.appBar, @required this.content});
}
