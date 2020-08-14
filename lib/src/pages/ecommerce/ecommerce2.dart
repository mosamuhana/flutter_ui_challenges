import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/ui_constants.dart';

class EcommerceTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: _filterListIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: _shoppingCartIcon,
          ),
        ],
        backgroundColor: Colors.white70,
        leading: IconButton(
          onPressed: () {},
          icon: _menuIcon,
        ),
        title: Text(
          'Shopping',
          style: _blackStyle,
        ),
        centerTitle: true,
        bottom: _bottomBar,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _shopItems.length + 1,
          itemBuilder: (_, i) => i == 0 ? _listFirstItem : _ShopItemCard(item: _shopItems[i - 1]),
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: _categoryIcon, title: Text("Shop")),
        BottomNavigationBarItem(icon: _favoriteBorderIcon, title: Text("Favorites")),
        BottomNavigationBarItem(icon: _notificationsIcon, title: Text("Notifications")),
        BottomNavigationBarItem(icon: _locationOnIcon, title: Text("Near me")),
        BottomNavigationBarItem(icon: _settingsIcon, title: Text("Settings")),
      ],
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
    );
  }

  PreferredSize get _bottomBar {
    return PreferredSize(
      child: Container(
        padding: _insetsAll10,
        child: Card(
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: IconButton(
                  icon: _searchIcon,
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  icon: _micIcon,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(80),
    );
  }

  Widget get _listFirstItem {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Branded Bucket",
            style: _s18Style,
          ),
          Text(
            "See All",
            style: _greyStyle,
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _ShopItemCard extends StatelessWidget {
  final _ShopItem item;

  const _ShopItemCard({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(bottom: 20),
      height: 300,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(item.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 10),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: _bold22Style,
                  ),
                  hSizedBox10,
                  Text(
                    item.category,
                    style: _grey18Style,
                  ),
                  hSizedBox20,
                  Text(
                    "\$${item.price}",
                    style: _red30Style,
                  ),
                  hSizedBox20,
                  Text(
                    item.tags,
                    style: _grey18H1_5Style,
                  )
                ],
              ),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 10),
                ],
              ),
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

final _shopItems = <_ShopItem>[
  _ShopItem(
    title: "Kappa Velour",
    category: "Bucket",
    price: 5500,
    tags: "#Cotton #polyster #Branded design",
    image: '$STORE_BASE_URL/img%2F1.jpg?alt=media',
  ),
  _ShopItem(
    title: "North Salty",
    category: "Bucket",
    price: 67000,
    tags: "#Cotton #polyster #Branded design",
    image: '$STORE_BASE_URL/img%2F2.jpg?alt=media',
  ),
  _ShopItem(
    title: "Mest Takel",
    category: "Bucket",
    price: 67000,
    tags: "#Cotton #polyster #Branded design",
    image: '$STORE_BASE_URL/img%2F3.jpg?alt=media',
  ),
];

class _ShopItem {
  final String title;
  final String category;
  final int price;
  final String tags;
  final String image;
  _ShopItem({
    this.title,
    this.category,
    this.price,
    this.tags,
    this.image,
  });
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _blackStyle = TextStyle(color: Colors.black87);
const _s18Style = TextStyle(fontSize: 18);
final _greyStyle = TextStyle(color: Colors.grey.shade500);
const _bold22Style = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
const _grey18Style = TextStyle(color: Colors.grey, fontSize: 18);
const _red30Style = TextStyle(color: Colors.red, fontSize: 30);
const _grey18H1_5Style = TextStyle(fontSize: 18, color: Colors.grey, height: 1.5);

final _filterListIcon = Icon(Icons.filter_list, color: Colors.grey.shade700);
final _shoppingCartIcon = Icon(Icons.shopping_cart, color: Colors.grey.shade700);
final _menuIcon = Icon(Icons.menu, color: Colors.grey.shade700);

const _categoryIcon = Icon(Icons.category);
const _favoriteBorderIcon = Icon(Icons.favorite_border);
const _notificationsIcon = Icon(Icons.notifications);
const _locationOnIcon = Icon(Icons.location_on);
const _settingsIcon = Icon(Icons.settings);
const _micIcon = Icon(Icons.mic);
const _searchIcon = Icon(Icons.search);

const _insetsAll10 = EdgeInsets.all(10);
