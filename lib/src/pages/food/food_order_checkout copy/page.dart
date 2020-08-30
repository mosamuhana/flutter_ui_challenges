import 'package:flutter/material.dart';

import 'models.dart';
import 'order_list_item.dart';
import 'data.dart';

class FoodOrderCheckoutPage extends StatefulWidget {
  static final String path = "lib/src/pages/food/food_order_checkout/page.dart";

  @override
  _FoodOrderCheckoutPageState createState() => _FoodOrderCheckoutPageState();
}

class _FoodOrderCheckoutPageState extends State<FoodOrderCheckoutPage> {
  final List<OrderItem> orderItems = getOrderItems();

  final vat = 10; // 10 %

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
              for (var item in orderItems) ...[
                OrderListItem(item: item),
                _hbox20,
              ],
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

  final _blackBoldS24Style = TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  final _boldS18Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  final _blackBoldS20Style = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

  final _greyBoldS20Style = TextStyle(color: Colors.grey.shade600, fontSize: 20, fontWeight: FontWeight.bold);

  final _indigoBoldS20Style = TextStyle(color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold);

  final _hDivider = Container(
    height: 2,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(5),
    ),
  );

  final _insets16 = EdgeInsets.all(16);

  final _insetsToolbar = EdgeInsets.fromLTRB(16, kToolbarHeight + 40, 16, 16);

  final _insetsH32V8 = EdgeInsets.symmetric(horizontal: 32, vertical: 8);

  final _hbox10 = SizedBox(height: 10);

  final _hbox20 = SizedBox(height: 20);

  final _hbox30 = SizedBox(height: 30);

  final _wbox20 = SizedBox(width: 20);

  final _wbox40 = SizedBox(width: 40);

  final _verticalShade = SizedBox(
    height: double.maxFinite,
    width: 80,
    child: Ink(
      decoration: BoxDecoration(color: Colors.grey.shade200),
    ),
  );

  final _spacer = Spacer();

  final _nextButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
}
