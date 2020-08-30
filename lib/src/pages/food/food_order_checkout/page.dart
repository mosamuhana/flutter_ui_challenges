import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class FoodOrderCheckoutPage extends StatelessWidget {
  static final String path = "lib/src/pages/food/food_order_checkout/page.dart";

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
          _verticalShade,
          ListView(
            padding: _insetsToolbar,
            children: [
              Text("My Order", style: _blackBoldS24Style),
              _hbox30,
              ..._orderItemList,
              _hDivider,
              _hbox20,
              _vatRow,
              _hbox20,
              _hDivider,
              _hbox10,
              _totalRow,
              _hbox10,
              _nextButton,
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> get _orderItemList {
    final list = <Widget>[];
    _orderItems.forEach((item) {
      list.add(OrderListItem(item: item));
      list.add(_hbox20);
    });
    return list;
  }

  Widget get _vatRow {
    return Row(
      children: [
        _wbox40,
        Text("VAT (10%)", style: _greyBoldS20Style),
        _spacer,
        Text("\$2", style: _greyBoldS20Style),
        _wbox20,
      ],
    );
  }

  Widget get _totalRow {
    return Row(
      children: [
        _wbox40,
        Text("Total", style: _blackBoldS20Style),
        _spacer,
        Text("\$49", style: _indigoBoldS20Style),
        _wbox20,
      ],
    );
  }

  Widget get _nextButton {
    return Padding(
      padding: _insetsH32V8,
      child: RaisedButton(
        padding: _insets16,
        elevation: 0,
        shape: _nextButtonShape,
        color: Colors.yellow.shade700,
        child: Text("Next", style: _boldS18Style),
        onPressed: () {},
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
      padding: _insetsH8,
      child: Row(
        children: [
          _image,
          _wbox20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _title,
                _hbox10,
                _counter,
              ],
            ),
          ),
          _wbox10,
          _total,
        ],
      ),
    );
  }

  Widget get _image {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: item.bgColor,
        borderRadius: _circularBorder20,
      ),
      child: item.image != null ? Image.network(item.image, fit: BoxFit.cover) : null,
    );
  }

  Widget get _title => Text(item.title, style: _blackBoldS18Style);

  Widget get _total => Text("\$${item.price * item.quantity}", style: _greyBoldS20Style);

  Widget get _counter {
    return Container(
      decoration: _counterDecoration,
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            iconSize: 18,
            padding: _insets2,
            icon: Icon(Icons.remove),
            onPressed: () {},
          ),
          Text("${item.quantity}", style: _blackBoldS18Style),
          IconButton(
            iconSize: 18,
            padding: _insets2,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _orderItems = <OrderItem>[
  OrderItem(
    title: "Manana Burger",
    quantity: 2,
    price: 12,
    bgColor: Colors.deepOrange,
    image: '$STORE_BASE_URL/food%2Fburger.jpg?alt=media',
  ),
  OrderItem(
    title: "Burger",
    quantity: 1,
    price: 15,
    bgColor: Colors.deepOrange,
    image: '$STORE_BASE_URL/food%2Fburger1.jpg?alt=media',
  ),
  OrderItem(
    title: "French Fries",
    quantity: 1,
    price: 8,
    bgColor: Colors.deepOrange,
    image: '$STORE_BASE_URL/food%2Ffrench-fries.jpg?alt=media',
  ),
];

class OrderItem {
  final String title;
  final int quantity;
  final double price;
  final String image;
  final Color bgColor;
  OrderItem({
    this.title,
    this.quantity,
    this.price,
    this.image,
    this.bgColor,
  });
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _blackBoldS24Style = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
const _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
const _blackBoldS18Style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
const _blackBoldS20Style = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
final _greyBoldS20Style = TextStyle(color: Colors.grey.shade600, fontSize: 20, fontWeight: FontWeight.bold);
const _indigoBoldS20Style = TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold);

const _circularRadius5 = Radius.circular(5);
const _circularRadius10 = Radius.circular(10);
const _circularRadius15 = Radius.circular(15);
const _circularRadius20 = Radius.circular(20);

const _circularBorder5 = BorderRadius.all(_circularRadius5);
const _circularBorder10 = BorderRadius.all(_circularRadius10);
const _circularBorder15 = BorderRadius.all(_circularRadius15);
const _circularBorder20 = BorderRadius.all(_circularRadius20);

final _hDivider = Container(
  height: 2,
  width: double.maxFinite,
  decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: _circularBorder5,
  ),
);

const _insets2 = EdgeInsets.all(2);
const _insets16 = EdgeInsets.all(16);
const _insetsToolbar = EdgeInsets.fromLTRB(16, kToolbarHeight + 40, 16, 16);
const _insetsH32V8 = EdgeInsets.symmetric(horizontal: 32, vertical: 8);
const _insetsH8 = EdgeInsets.symmetric(horizontal: 8);

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);
const _wbox10 = SizedBox(width: 10);
const _wbox20 = SizedBox(width: 20);
const _wbox40 = SizedBox(width: 40);

final _verticalShade = SizedBox(
  height: double.maxFinite,
  width: 80,
  child: Ink(
    decoration: BoxDecoration(color: Colors.grey.shade200),
  ),
);

const _spacer = Spacer();

const _nextButtonShape = RoundedRectangleBorder(borderRadius: _circularBorder15);

final _counterDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey, width: 1),
  borderRadius: _circularBorder10,
);
