import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class FoodCheckoutOnePage extends StatelessWidget {
  static final String path = "lib/src/pages/food/food_checkout.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 80,
            child: Ink(
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(
              16,
              kToolbarHeight + 40,
              16,
              16,
            ),
            children: [
              Text(
                "My Order",
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              _hbox30,
              OrderListItem(
                item: OrderItem(
                  title: "Manana Burger",
                  qty: 2,
                  price: 12,
                  bgColor: Colors.deepOrange,
                  image: _burger,
                ),
              ),
              _hbox20,
              OrderListItem(
                item: OrderItem(title: "Burger", qty: 1, price: 15, bgColor: Colors.deepOrange, image: _burger1),
              ),
              _hbox20,
              OrderListItem(
                item: OrderItem(title: "French Fries", qty: 1, price: 8, bgColor: Colors.deepOrange, image: _frenchFries),
              ),
              _hbox20,
              _buildDivider(),
              _hbox20,
              Row(
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "VAT (10%)",
                    style: _greyBoldS20Style,
                  ),
                  Spacer(),
                  Text(
                    "\$2",
                    style: _greyBoldS20Style,
                  ),
                  _wbox20,
                ],
              ),
              _hbox20,
              _buildDivider(),
              _hbox10,
              Row(
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "Total",
                    style: _greyBoldS20Style.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    "\$49",
                    style: _greyBoldS20Style.copyWith(color: Colors.indigo),
                  ),
                  _wbox20,
                ],
              ),
              _hbox10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: RaisedButton(
                  padding: const EdgeInsets.all(16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: Colors.yellow.shade700,
                  child: Text(
                    "Next",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class OrderListItem extends StatelessWidget {
  final OrderItem item;

  const OrderListItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: item.bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: item.image != null ? Image.network(item.image, fit: BoxFit.cover) : null,
          ),
          _wbox20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _hbox10,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 40,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18,
                        padding: const EdgeInsets.all(2),
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text(
                        "${item.qty}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        iconSize: 18,
                        padding: const EdgeInsets.all(2),
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          _wbox10,
          Text(
            "\$${item.price * item.qty}",
            style: _greyBoldS20Style,
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

const _burger = '$STORE_BASE_URL/food%2Fburger.jpg?alt=media';
const _burger1 = '$STORE_BASE_URL/food%2Fburger1.jpg?alt=media';
const _frenchFries = '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media';

class OrderItem {
  final String title;
  final int qty;
  final double price;
  final String image;
  final Color bgColor;
  OrderItem({this.title, this.qty, this.price, this.image, this.bgColor});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);
const _wbox10 = SizedBox(width: 10);
const _wbox20 = SizedBox(width: 20);

final _greyBoldS20Style = TextStyle(color: Colors.grey.shade600, fontSize: 20, fontWeight: FontWeight.bold);
