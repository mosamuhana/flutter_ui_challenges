import 'package:flutter/material.dart';

import '../../../core/res/assets.dart';
import '../../../core/ui_constants.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

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
              16.0,
              kToolbarHeight + 40.0,
              16.0,
              16.0,
            ),
            children: [
              Text(
                "My Order",
                style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              hSizedBox30,
              OrderListItem(
                item: OrderItem(
                  title: "Manana Burger",
                  qty: 2,
                  price: 12,
                  bgColor: Colors.deepOrange,
                  image: burger,
                ),
              ),
              hSizedBox20,
              OrderListItem(
                item: OrderItem(title: "Burger", qty: 1, price: 15, bgColor: Colors.deepOrange, image: burger1),
              ),
              hSizedBox20,
              OrderListItem(
                item: OrderItem(title: "French Fries", qty: 1, price: 8, bgColor: Colors.deepOrange, image: frenchFries),
              ),
              hSizedBox20,
              _buildDivider(),
              hSizedBox20,
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "VAT (10%)",
                    style: priceTextStyle,
                  ),
                  Spacer(),
                  Text(
                    "\$2",
                    style: priceTextStyle,
                  ),
                  wSizedBox20,
                ],
              ),
              hSizedBox20,
              _buildDivider(),
              hSizedBox10,
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "Total",
                    style: priceTextStyle.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    "\$49",
                    style: priceTextStyle.copyWith(color: Colors.indigo),
                  ),
                  wSizedBox20,
                ],
              ),
              hSizedBox10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: RaisedButton(
                  padding: const EdgeInsets.all(16.0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.yellow.shade700,
                  child: Text(
                    "Next",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

class OrderItem {
  final String title;
  final int qty;
  final double price;
  final String image;
  final Color bgColor;
  OrderItem({this.title, this.qty, this.price, this.image, this.bgColor});
}

class OrderListItem extends StatelessWidget {
  final OrderItem item;

  const OrderListItem({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: item.bgColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: item.image != null ? Image.network(item.image, fit: BoxFit.cover) : null,
          ),
          wSizedBox20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                hSizedBox10,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                      ),
                      Text(
                        "${item.qty}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          wSizedBox10,
          Text(
            "\$${item.price * item.qty}",
            style: priceTextStyle,
          ),
        ],
      ),
    );
  }
}
