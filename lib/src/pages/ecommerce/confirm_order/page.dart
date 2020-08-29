import 'package:flutter/material.dart';

class ConfirmOrderPage extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/confirm_order/page.dart";

  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  String address;
  String contact;
  String deliveryOption;

  final _order = _Order(
    address: 'Chabahil, Kathmandu',
    phone: '+98-1852-2122',
    total: 500,
    deliveryFee: 100,
  );

  @override
  void initState() {
    address = _order.address;
    contact = _order.phone;
    deliveryOption = 'Cash on Delivery';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addresses = <String>[_order.address, 'New Address'];
    final contacts = <String>[_order.phone, 'New Phone'];
    const paymentOptions = <String>['Cash on Delivery', 'Credit Card'];

    return Scaffold(
      appBar: AppBar(title: Text("Confirm Order")),
      body: SingleChildScrollView(
        padding: _insetsH20V10,
        child: Column(
          children: [
            _totalDetailRow('Subtotal', _order.total),
            _hbox10,
            _totalDetailRow('Delivery fee', _order.deliveryFee),
            _hbox10,
            _totalDetailRow('Total', _order.total + _order.deliveryFee, Theme.of(context).textTheme.headline6),
            _hbox20,
            Column(
              children: [
                _buildTitle('DELIVERY ADDRESS'),
                for (var item in addresses)
                  RadioListTile(
                    value: item,
                    groupValue: address,
                    title: Text(item),
                    onChanged: (value) => setState(() => address = value),
                  ),
              ],
            ),
            Column(
              children: [
                _buildTitle('CONTACT NUMBER'),
                for (var item in contacts)
                  RadioListTile(
                    value: item,
                    groupValue: contact,
                    title: Text(item),
                    onChanged: (value) => setState(() => contact = value),
                  ),
              ],
            ),
            _hbox20,
            Column(
              children: [
                _buildTitle('PAYMENT OPTION'),
                for (var item in paymentOptions)
                  RadioListTile(
                    value: item,
                    groupValue: deliveryOption,
                    title: Text(item),
                    onChanged: (value) => setState(() => deliveryOption = value),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Confirm Order",
                  style: _whiteStyle,
                ),
                onPressed: () => print('Confirm Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Container(
      color: Colors.grey.shade200,
      padding: _insets8,
      width: double.infinity,
      child: Text(text),
    );
  }

  Widget _totalDetailRow(String name, double value, [TextStyle style]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: style),
        Text("Rs. $value", style: style),
      ],
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);

  final _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  final _insets8 = EdgeInsets.all(8);

  final _whiteStyle = TextStyle(color: Colors.white);
}

class _Order {
  final String address;
  final String phone;
  final double total;
  final double deliveryFee;
  _Order({
    this.address,
    this.phone,
    this.total,
    this.deliveryFee,
  });
}
