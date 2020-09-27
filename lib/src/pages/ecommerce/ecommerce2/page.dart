import 'package:flutter/material.dart';

import 'data.dart';
import 'shop_item_card.dart';

class Ecommerce2Page extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce2/page.dart";

  @override
  _Ecommerce2PageState createState() => _Ecommerce2PageState();
}

class _Ecommerce2PageState extends State<Ecommerce2Page> {
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavItems;

  @override
  void initState() {
    super.initState();

    bottomNavItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: _categoryIcon, label: "Shop"),
      BottomNavigationBarItem(icon: _favoriteBorderIcon, label: "Favorites"),
      BottomNavigationBarItem(icon: _notificationsIcon, label: "Notifications"),
      BottomNavigationBarItem(icon: _locationOnIcon, label: "Near me"),
      BottomNavigationBarItem(icon: _settingsIcon, label: "Settings"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: _buildContent(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: bottomNavItems,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (currentIndex > 0) {
      return otherPage;
    }

    return ListView.builder(
      itemCount: shopItems.length + 1,
      itemBuilder: (_, i) => i == 0 ? _listHeader : ShopItemCard(item: shopItems[i - 1]),
    );
  }

  Widget get otherPage {
    var item = bottomNavItems[currentIndex];
    var label = item.label;
    var icon = (item.icon as Icon).icon;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80),
          _hbox20,
          Text(label, style: _blackS30Style),
        ],
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
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
      /*
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: _menuIcon,
      ),
      */
      title: Text('Shopping', style: _black87Style),
      centerTitle: true,
      bottom: PreferredSize(
        child: Container(
          padding: _insets10,
          child: Card(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: IconButton(
                    icon: _searchIcon,
                    onPressed: () => print('Search'),
                  ),
                  suffixIcon: IconButton(
                    icon: _micIcon,
                    onPressed: () => print('Mic'),
                  ),
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
    );
  }

  Widget get _listHeader {
    return Container(
      padding: _insets20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Branded Bucket", style: _s18Style),
          Text("See All", style: _greyStyle),
        ],
      ),
    );
  }

  final _hbox20 = SizedBox(height: 20);

  final _black87Style = TextStyle(color: Colors.black87);
  final _s18Style = TextStyle(fontSize: 18);
  final _greyStyle = TextStyle(color: Colors.grey.shade500);
  final _blackS30Style = TextStyle(color: Colors.black, fontSize: 30);

  final _filterListIcon = Icon(Icons.filter_list, color: Colors.grey.shade700);
  final _shoppingCartIcon = Icon(Icons.shopping_cart, color: Colors.grey.shade700);
  final _menuIcon = Icon(Icons.menu, color: Colors.grey.shade700);
  final _categoryIcon = Icon(Icons.category);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _notificationsIcon = Icon(Icons.notifications);
  final _locationOnIcon = Icon(Icons.location_on);
  final _settingsIcon = Icon(Icons.settings);
  final _micIcon = Icon(Icons.mic);
  final _searchIcon = Icon(Icons.search);

  final _insets10 = EdgeInsets.all(10);
  final _insets20 = EdgeInsets.all(20);
}
