import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class CakeDetailsPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/cake_details/page.dart";

  @override
  _CakeDetailsPageState createState() => _CakeDetailsPageState();
}

class _CakeDetailsPageState extends State<CakeDetailsPage> {
  final String productName = 'Fruits Cake';
  final String productDescription = 'strawberry & kiwi special';
  final String productImage = '$STORE_BASE_URL/food%2Fcake.png?alt=media';
  final String deliveryAddress1 = '45, Amarlands';
  final String deliveryAddress2 = 'Nr. Hamer Road, London';

  final ingredents = <_Ingredent>[
    _Ingredent(title: '4 Eggs', image: '$STORE_BASE_URL/food%2Feggs.png?alt=media'),
    _Ingredent(title: '2 tsp vanilla', image: '$STORE_BASE_URL/food%2Fvanilla.png?alt=media'),
    _Ingredent(title: '1 cup sugar', image: '$STORE_BASE_URL/food%2Fsugar.png?alt=media'),
    /*
    _Ingredent(title: '4 Eggs', image: '$STORE_BASE_URL/food%2Feggs.png?alt=media'),
    _Ingredent(title: '4 Eggs', image: '$STORE_BASE_URL/food%2Feggs.png?alt=media'),
    _Ingredent(title: '4 Eggs', image: '$STORE_BASE_URL/food%2Feggs.png?alt=media'),
    */
  ];

  final priceMap = <String, double>{
    '1': 84.99,
    '2': 149.99,
    '3': 229.99,
    '4': 299.99,
  };

  int quantity = 1;
  double price = 84.99;
  String priceKey = '1';

  double get totalPrice => quantity * price;

  @override
  Widget build(BuildContext context) {
    final productNameStyle =
        Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal);

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text('$productName', style: productNameStyle),
              _hbox10,
              Text('$productDescription', style: _primaryS16Style),
              _weightChoiceList,
              _hbox20,
              Container(
                height: 180,
                child: Row(
                  children: [
                    Expanded(
                      child: PNetworkImage(productImage),
                    ),
                    _quantity,
                    _wbox10,
                  ],
                ),
              ),
              _PriceWidget(value: totalPrice),
              _hbox20,
              _ingredentList,
              _hbox20,
              _deliveryInfo,
              _hbox10,
              Row(
                children: [
                  _wbox20,
                  Text("Ratings", style: _whiteS16Style),
                  _wbox20,
                  _rating,
                  Text("(55)", style: _greyS16Style),
                ],
              ),
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

    priceMap.forEach((key, value) {
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
        _starIcon,
        _starIcon,
        _starIcon,
        _starIcon,
        _starHalfIcon,
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
    final list = ingredents.map<Widget>((item) {
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
          PNetworkImage(_mapImage, height: 50),
          _wbox20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("DELIVERY", style: _whiteS16Style),
                Text(deliveryAddress1 ?? '', style: _greyStyle),
                Text(deliveryAddress2 ?? '', style: _greyStyle),
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
}

// ----------------------------------------------------------------------------------
// Private Widgets ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _PriceWidget extends StatelessWidget {
  final double value;

  const _PriceWidget({Key key, @required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var v = (value * 100).round().toString();
    var i = v.length - 2;
    var integer = v.substring(0, i);
    var fraction = v.substring(i);
    return Container(
      alignment: Alignment.centerRight,
      padding: _insetsR20,
      width: double.infinity,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "\$$integer.", style: _whiteBoldS28Style),
            TextSpan(text: "$fraction", style: _whiteStyle),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Data ---------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _Ingredent {
  final String title;
  final String image;
  const _Ingredent({this.title, this.image});
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const String _mapImage = '$STORE_BASE_URL/food%2Fmap.png?alt=media';

const _primaryColor = Color(0xff7b7517);
const _backgroundColor = Color(0xff2f2f4f);
const _overlayColor = Color(0xff212129);

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _wbox10 = SizedBox(width: 10);
const _wbox20 = SizedBox(width: 20);

const _primaryS16Style = TextStyle(color: _primaryColor, fontSize: 16);
const _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
//const _primaryBoldStyle = TextStyle(color: _primaryColor, fontWeight: FontWeight.bold);
const _whiteBoldS28Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28);
const _whiteStyle = TextStyle(color: Colors.white);
const _whiteS16Style = TextStyle(color: Colors.white, fontSize: 16);
final _greyStyle = TextStyle(color: Colors.grey.shade300);
final _greyS16Style = TextStyle(color: Colors.grey, fontSize: 16);
const _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1.50, fontWeight: FontWeight.normal);

const _addIcon = Icon(Icons.add, color: Colors.white);
const _removeIcon = Icon(Icons.remove, color: Colors.white);
const _starIcon = Icon(Icons.star, color: Colors.yellow);
const _starHalfIcon = Icon(Icons.star_half, color: Colors.yellow);
const _arrowBackIosIcon = Icon(Icons.arrow_back_ios, color: Colors.white);
const _favoriteBorderIcon = Icon(Icons.favorite_border, color: Colors.white);

const _insets8 = EdgeInsets.all(8);
const _insetsR20 = EdgeInsets.only(right: 20);
const _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
const _insetsH16 = EdgeInsets.symmetric(horizontal: 16);
const _insetsH30V8 = EdgeInsets.symmetric(horizontal: 30, vertical: 8);
const _insetsH4V16 = EdgeInsets.symmetric(horizontal: 4, vertical: 16);

const _circularRadius10 = Radius.circular(10);
const _circularRadius40 = Radius.circular(40);
const _circularBorder10 = BorderRadius.all(_circularRadius10);
const _circularBorder40 = BorderRadius.all(_circularRadius40);

const _makeOrderShape = RoundedRectangleBorder(borderRadius: _circularBorder40);

const _ingredentsDecoration = BoxDecoration(color: _overlayColor, borderRadius: _circularBorder10);

//const _verticalDivider = VerticalDivider(color: Colors.grey);
