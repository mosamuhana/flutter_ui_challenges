import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';
import 'models.dart';
import 'data.dart';
import 'price_value.dart';

class CakeDetailsPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/cake_details/page.dart";

  @override
  _CakeDetailsPageState createState() => _CakeDetailsPageState();
}

class _CakeDetailsPageState extends State<CakeDetailsPage> {
  Order order;

  @override
  void initState() {
    order = getOrder();
    super.initState();
  }

  int quantity = 1;
  double price = 84.99;
  String priceKey = '1';

  double get totalPrice => quantity * price;

  @override
  Widget build(BuildContext context) {
    final productNameStyle = Theme.of(context).textTheme.headline6.copyWith(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.normal,
        );

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text('${order.product.name}', style: productNameStyle),
              _hbox10,
              Text('${order.product.description}', style: _primaryS16Style),
              _weightChoiceList,
              _hbox20,
              Container(
                height: 180,
                child: Row(
                  children: [
                    Expanded(
                      child: PNetworkImage(order.product.image),
                    ),
                    _quantity,
                    _wbox10,
                  ],
                ),
              ),
              PriceValue(value: totalPrice),
              _hbox20,
              _ingredentList,
              _hbox20,
              _deliveryInfo,
              _hbox10,
              _rating,
              _hbox20,
              _makeOrderButton,
              _hbox20,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: _arrowBackIosIcon,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: _favoriteBorderIcon,
          onPressed: () {},
        )
      ],
    );
  }

  Widget get _weightChoiceList {
    final list = <Widget>[];

    order.product.prices.forEach((key, value) {
      list.addAll([
        _wbox20,
        ChoiceChip(
          label: Text("$key Kg", style: _whiteBoldStyle),
          labelPadding: _insetsH20,
          backgroundColor: _backgroundColor,
          selected: priceKey == key,
          onSelected: (selected) {
            if (selected) {
              print('$key: $selected ($value)');
              priceKey = key;
              price = value;
              setState(() {});
            }
          },
          selectedColor: _primaryColor,
        ),
      ]);
    });

    return Container(
      height: 60,
      child: ListView(
        padding: _insets8,
        scrollDirection: Axis.horizontal,
        children: list,
      ),
    );
  }

  Widget get _rating {
    return Row(
      children: [
        _wbox20,
        Text("Ratings", style: _whiteS16Style),
        _wbox20,
        Row(
          children: [
            _starIcon,
            _starIcon,
            _starIcon,
            _starIcon,
            _starHalfIcon,
          ],
        ),
        Text("(${order.delivery.rating})", style: _greyS16Style),
      ],
    );
  }

  Widget get _quantity {
    return Column(
      children: [
        IconButton(
          icon: _addIcon,
          onPressed: quantity >= 100 ? null : () => setState(() => quantity++),
        ),
        CircleAvatar(
          child: Text("$quantity"),
          backgroundColor: _primaryColor,
        ),
        IconButton(
          icon: _removeIcon,
          onPressed: quantity <= 1 ? null : () => setState(() => quantity--),
        ),
      ],
    );
  }

  Widget get _ingredentList {
    final list = order.product.ingredents.map<Widget>((item) {
      return Container(
        constraints: BoxConstraints(
          minWidth: 80,
          minHeight: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PNetworkImage(item.image),
            Text(item.title, style: _whiteStyle),
          ],
        ),
      );
    }).toList();

    return Container(
      margin: _insetsH16,
      padding: _insetsH4V16,
      decoration: _ingredentsDecoration,
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: list,
      ),
    );
  }

  Widget get _deliveryInfo {
    return Container(
      child: Row(
        children: [
          _wbox20,
          PNetworkImage(MAP_IMAGE, height: 50),
          _wbox20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("DELIVERY", style: _whiteS16Style),
                Text(order.delivery.address1 ?? '', style: _greyStyle),
                Text(order.delivery.address2 ?? '', style: _greyStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _makeOrderButton {
    return RaisedButton(
      shape: _makeOrderShape,
      padding: _insetsH30V8,
      onPressed: () => print('Make order now'),
      child: Text('Make order now', style: _whiteS18Style),
      color: _primaryColor,
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox10 = SizedBox(width: 10);
  final _wbox20 = SizedBox(width: 20);

  final _primaryS16Style = TextStyle(color: _primaryColor, fontSize: 16);
  final _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final _whiteStyle = TextStyle(color: Colors.white);
  final _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);
  final _greyStyle = TextStyle(color: Colors.grey.shade300);
  final _greyS16Style = TextStyle(color: Colors.grey, fontSize: 16);
  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1.50, fontWeight: FontWeight.normal);

  final _addIcon = Icon(Icons.add, color: Colors.white);
  final _removeIcon = Icon(Icons.remove, color: Colors.white);
  final _starIcon = Icon(Icons.star, color: Colors.yellow);
  final _starHalfIcon = Icon(Icons.star_half, color: Colors.yellow);
  final _arrowBackIosIcon = Icon(Icons.arrow_back_ios, color: Colors.white);
  final _favoriteBorderIcon = Icon(Icons.favorite_border, color: Colors.white);

  final _insets8 = EdgeInsets.all(8);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
  final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);
  final _insetsH30V8 = EdgeInsets.symmetric(horizontal: 30, vertical: 8);
  final _insetsH4V16 = EdgeInsets.symmetric(horizontal: 4, vertical: 16);

  final _makeOrderShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));

  final _ingredentsDecoration = BoxDecoration(color: _overlayColor, borderRadius: BorderRadius.circular(10));
}

const _primaryColor = Color(0xff7b7517);
const _backgroundColor = Color(0xff2f2f4f);
const _overlayColor = Color(0xff212129);

const MAP_IMAGE = '$STORE_BASE_URL/food%2Fmap.png?alt=media';
