import 'package:flutter/material.dart';

class ConfirmOrderPage extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/confirm_order1.dart";

  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  String address;
  String contact;
  String deliveryOption;

  @override
  void initState() {
    address = _order.address;
    contact = _order.phone;
    deliveryOption = 'Cash on Delivery';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Order")),
      body: SingleChildScrollView(
        padding: _insetsSymmetricH20V10,
        child: Column(
          children: [
            ..._totalDetails,
            _hbox20,
            _deliveryAddress,
            _contactNumber,
            _hbox20,
            _paymentOption,
            _confirmOrderButton,
          ],
        ),
      ),
    );
  }

  List<Widget> get _totalDetails {
    return [
      _totalDetailRow('Subtotal', _order.total),
      _hbox10,
      _totalDetailRow('Delivery fee', _order.deliveryFee),
      _hbox10,
      _totalDetailRow('Total', _order.total + _order.deliveryFee, Theme.of(context).textTheme.headline6),
    ];
  }

  Widget get _deliveryAddress {
    final addresses = <String>[
      _order.address,
      'New Address',
    ];

    return Column(
      children: [
        _title('DELIVERY ADDRESS'),
        for (var item in addresses)
          RadioListTile(
            value: item,
            groupValue: address,
            title: Text(item),
            onChanged: (value) => setState(() => address = value),
          ),
      ],
    );
  }

  Widget get _contactNumber {
    final contacts = <String>[
      _order.phone,
      'New Phone',
    ];

    return Column(
      children: [
        _title('CONTACT NUMBER'),
        for (var item in contacts)
          RadioListTile(
            value: item,
            groupValue: contact,
            title: Text(item),
            onChanged: (value) => setState(() => contact = value),
          ),
      ],
    );
  }

  Widget get _paymentOption {
    const options = ['Cash on Delivery', 'Credit Card'];
    return Column(
      children: [
        _title('PAYMENT OPTION'),
        for (var item in options)
          RadioListTile(
            value: item,
            groupValue: deliveryOption,
            title: Text(item),
            onChanged: (value) => setState(() => deliveryOption = value),
          ),
      ],
    );
  }

  Widget get _confirmOrderButton {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text(
          "Confirm Order",
          style: _whiteStyle,
        ),
        onPressed: () => print('Confirm Order'),
      ),
    );
  }

  Widget _title(String text) {
    return Container(
      color: Colors.grey.shade200,
      padding: _insetsAll8,
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
}

// ----------------------------------------------------------------------------------
// Privates -------------------------------------------------------------------------
// ----------------------------------------------------------------------------------

final _order = _Order(
  address: 'Chabahil, Kathmandu',
  phone: '+98-1852-2122',
  total: 500,
  deliveryFee: 100,
);

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

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);

const _insetsSymmetricH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const _insetsAll8 = EdgeInsets.all(8);

const _whiteStyle = TextStyle(color: Colors.white);
