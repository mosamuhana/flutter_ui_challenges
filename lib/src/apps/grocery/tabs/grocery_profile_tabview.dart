import 'package:flutter/material.dart';

import '../widgets/grocery_title.dart';

class GroceryProfileTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: _insets10,
        children: [
          ListTile(
            onTap: () {},
            leading: _editIcon,
            title: GroceryTitle(text: "My Orders"),
          ),
          ListTile(
            onTap: () {},
            leading: _favoriteBorderIcon,
            title: GroceryTitle(text: "My Favorite"),
          ),
          ListTile(
            onTap: () {},
            leading: _accountBalanceWalletIcon,
            title: GroceryTitle(text: "Payment Details"),
          ),
          ListTile(
            onTap: () {},
            leading: _settingsIcon,
            title: GroceryTitle(text: "My Account"),
          ),
        ],
      ),
    );
  }

  final _insets10 = EdgeInsets.all(10);
  final _editIcon = Icon(Icons.edit);
  final _settingsIcon = Icon(Icons.settings);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);
  final _accountBalanceWalletIcon = Icon(Icons.account_balance_wallet);
}
