import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class CartTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/cart2.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, int index) => _ItemCard(item: _items[index]),
            ),
          ),
          _checkoutSection,
        ],
      ),
    );
  }

  Widget get _checkoutSection {
    return Material(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _insetsT10L10R10,
            child: Row(
              children: [
                Text("Checkout Price:", style: _checkoutPriceTitleStyle),
                _spacer,
                Text("Rs. 5000", style: _checkoutPriceValueStyle)
              ],
            ),
          ),
          _checkoutButton,
        ],
      ),
    );
  }

  Widget get _checkoutButton {
    return Padding(
      padding: _insetsAll10,
      child: Material(
        color: Colors.red,
        elevation: 1,
        child: InkWell(
          onTap: () {
            print('Checkout');
          },
          splashColor: Colors.redAccent,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: _insetsAll10,
              child: Text(
                "Checkout",
                textAlign: TextAlign.center,
                style: _checkoutButtonStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _ItemCard extends StatelessWidget {
  final _Item item;

  const _ItemCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: _insetsAll0,
      margin: _insetsAll10,
      height: 130,
      child: Row(
        children: [
          _image,
          Flexible(
            child: Padding(
              padding: _insetsSymmetricH10,
              child: Column(
                children: [
                  Row(
                    children: [
                      _itemName,
                      _deleteButton,
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price: "),
                      _wbox5,
                      Text('\$${item.price}', style: _itemPriceStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sub Total: "),
                      _wbox5,
                      Text('\$${item.subtotal}', style: _itemSubtotalStyle),
                    ],
                  ),
                  Row(
                    children: [
                      _shipsFreeButton,
                      _spacer,
                      _ItemCounter(
                        value: item.count,
                        onChange: (value) {
                          print('new value: $value');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _image {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_itemImageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget get _itemName {
    return Flexible(
      child: Text(
        '${item.name}',
        overflow: TextOverflow.fade,
        softWrap: true,
        style: _itemNameStyle,
      ),
    );
  }

  Widget get _deleteButton {
    return Container(
      width: 50,
      child: IconButton(
        onPressed: () => print("Delete"),
        color: Colors.red,
        icon: Icon(Icons.delete),
        iconSize: 20,
      ),
    );
  }

  Widget get _shipsFreeButton {
    return Text("Ships Free", style: _orangeStyle);
  }
}

class _ItemCounter extends StatefulWidget {
  final int value;
  final void Function(int) onChange;

  const _ItemCounter({
    Key key,
    this.value = 0,
    this.onChange,
  }) : super(key: key);

  @override
  __ItemCounterState createState() => __ItemCounterState();
}

class __ItemCounterState extends State<_ItemCounter> {
  int count;

  @override
  void initState() {
    count = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _decrementButton,
        _wbox4,
        Card(
          child: Padding(
            padding: _insetsAll8,
            child: Text('$count'),
          ),
        ),
        _wbox4,
        _incrementButton,
      ],
    );
  }

  void _notify() {
    widget.onChange?.call(count);
    setState(() {});
  }

  Widget get _decrementButton {
    return InkWell(
      onTap: () {
        count--;
        _notify();
      },
      splashColor: Colors.redAccent.shade200,
      child: Container(
        decoration: _circularDecoration50,
        alignment: Alignment.center,
        child: Padding(
          padding: _insetsAll6,
          child: _removeIcon,
        ),
      ),
    );
  }

  Widget get _incrementButton {
    return InkWell(
      onTap: () {
        count++;
        _notify();
      },
      splashColor: Colors.lightBlue,
      child: Container(
        decoration: _circularDecoration50,
        alignment: Alignment.center,
        child: Padding(
          padding: _insetsAll6,
          child: _addIcon,
        ),
      ),
    );
  }
}

final _items = <_Item>[
  _Item(name: 'Item 1', price: 200, subtotal: 250, count: 1),
  _Item(name: 'Item 2', price: 220, subtotal: 300, count: 3),
  _Item(name: 'Item 3', price: 320, subtotal: 400, count: 2),
  _Item(name: 'Item 4', price: 370, subtotal: 420, count: 2),
  _Item(name: 'Item 5', price: 395, subtotal: 500, count: 1),
  _Item(name: 'Item 6', price: 400, subtotal: 510, count: 4),
];

class _Item {
  final String name;
  final double price;
  final double subtotal;
  final int count;
  _Item({
    this.name,
    this.price,
    this.subtotal,
    this.count,
  });
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _itemImageUrl = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

const _spacer = Spacer();

const _checkoutPriceTitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
const _checkoutPriceValueStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
const _checkoutButtonStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
const _itemNameStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 15);
const _itemPriceStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
const _itemSubtotalStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.orange);
const _orangeStyle = TextStyle(color: Colors.orange);

const _insetsAll0 = EdgeInsets.all(0);
const _insetsAll6 = EdgeInsets.all(6);
const _insetsAll8 = EdgeInsets.all(8);
const _insetsAll10 = EdgeInsets.all(10);
const _insetsT10L10R10 = EdgeInsets.only(top: 10, left: 10, right: 10);
const _insetsSymmetricH10 = EdgeInsets.symmetric(horizontal: 10);

const _wbox5 = SizedBox(width: 5);
const _wbox4 = SizedBox(width: 4);

const _removeIcon = Icon(Icons.remove, color: Colors.redAccent, size: 20);
const _addIcon = Icon(Icons.add, color: Colors.green, size: 20);

final _circularDecoration50 = BoxDecoration(borderRadius: BorderRadius.circular(50));
