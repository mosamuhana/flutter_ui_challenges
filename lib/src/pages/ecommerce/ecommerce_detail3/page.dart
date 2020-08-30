import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import 'product.dart';
import 'data.dart';

class EcommerceDetail3Page extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail3/page.dart";

  final Product product = getProduct();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              child: PNetworkImage(product.image, fit: BoxFit.cover),
            ),
            _pageContent,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _pageContent {
    return Column(
      children: [
        _spacer,
        Expanded(
          child: Container(
            decoration: _circularDecoration20,
            child: Column(
              children: [
                _hbox30,
                _contentCard,
                _bottomCard,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget get _contentCard {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Docside", style: _blackBoldS28Style),
              trailing: IconButton(
                icon: _favoriteBorderIcon,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: _insetsH16V8,
              child: Text(product.docside, style: _greyStyle),
            ),
            ExpansionTile(
              title: Text("Show Details", style: _blackBoldStyle),
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: _insets16,
                  child: Text(product.details),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _bottomCard {
    return Container(
      padding: _insets32,
      decoration: _circularTopDecoration20,
      child: Row(
        children: [
          Text("\$${product.price}", style: _whiteBoldS18Style),
          _wbox20,
          _spacer,
          RaisedButton(
            padding: _insetsH16V8,
            shape: _circularShape10,
            onPressed: () {},
            color: Colors.orange,
            textColor: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add to Cart", style: _boldS16Style),
                _wbox20,
                Container(
                  padding: _insets8,
                  child: _arrowForwardIosIcon,
                  decoration: _circularDecoration10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final _hbox30 = SizedBox(height: 30);
  final _wbox20 = SizedBox(width: 20);

  final _blackBoldStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  final _blackBoldS28Style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28);
  final _greyStyle = TextStyle(color: Colors.grey.shade600);
  final _whiteBoldS18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  final _boldS16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final _spacer = Spacer();

  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);
  final _insets32 = EdgeInsets.all(32);
  final _insetsH16V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  final _arrowForwardIosIcon = Icon(Icons.arrow_forward_ios, color: Colors.orange, size: 16);
  final _favoriteBorderIcon = Icon(Icons.favorite_border);

  final _circularShape10 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  final _circularDecoration10 = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10));
  final _circularDecoration20 = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20));

  final _circularTopDecoration20 = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    color: Colors.grey.shade900,
  );
}
