import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/widgets.dart';

class CheckoutOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/cart1.dart";

  @override
  _CheckoutOnePageState createState() => _CheckoutOnePageState();
}

class _CheckoutOnePageState extends State<CheckoutOnePage> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Choose your plan", style: _pageTitleStyle),
            _hbox20,
            ..._offerPlans,
            _hbox30,
            ..._paymentMethods,
            _hbox20,
            _continueButton,
          ],
        ),
      ),
    );
  }

  List<Widget> get _offerPlans {
    return [
      Row(
        children: [
          _PlanOffer(
            title: 'Free',
            subtitle: '7 days',
            active: selectedIndex == 0,
            onTap: () => setState(() => selectedIndex = 0),
          ),
          _PlanOffer(
            title: '\$450',
            subtitle: 'Per week',
            active: selectedIndex == 1,
            onTap: () => setState(() => selectedIndex = 1),
          ),
        ],
      ),
      Row(
        children: [
          _PlanOffer(
            title: '\$900',
            subtitle: 'Per month',
            active: selectedIndex == 2,
            onTap: () => setState(() => selectedIndex = 2),
          ),
          _PlanOffer(
            title: '\$2000',
            subtitle: 'Lifetime',
            active: selectedIndex == 3,
            onTap: () => setState(() => selectedIndex = 3),
          ),
        ],
      ),
    ];
  }

  List<Widget> get _paymentMethods {
    return [
      _PaymentMethod(
        title: 'Paypal',
        icon: _paypalIcon,
        onTap: () => print('Paypal'),
      ),
      _PaymentMethod(
        title: 'Google Pay',
        icon: _googleWalletIcon,
        onTap: () => print('Google Pay'),
      ),
      _PaymentMethod(
        title: 'Apple Pay',
        icon: _applePayIcon,
        onTap: () => print('Apple Pay'),
      ),
    ];
  }

  Widget get _continueButton {
    return Container(
      width: double.infinity,
      padding: _insetsSymmetricH32V16,
      child: RaisedButton(
        elevation: 0,
        padding: _insetsAll24,
        shape: _circularShape10,
        child: Text("Continue"),
        color: Colors.indigo,
        textColor: Colors.white,
        onPressed: () {
          print('Continue Pressed');
        },
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Privates ------------------------------------------------------------------
// ----------------------------------------------------------------------------------

class _PlanOffer extends StatelessWidget {
  final bool active;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _PlanOffer({
    Key key,
    @required this.title,
    @required this.subtitle,
    this.active = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: RoundedContainer(
          color: !active ? null : Colors.indigo,
          margin: _insetsSymmetricH8V8,
          child: Column(
            children: [
              Text(
                title,
                style: !active ? _titleStyle : _titleStyle.copyWith(color: Colors.white),
              ),
              _hbox5,
              Text(
                subtitle,
                style: !active ? _subtitleStyle : _subtitleStyle.copyWith(color: Colors.white60),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  const _PaymentMethod({
    Key key,
    @required this.title,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: _insetsAll8,
      padding: _insetsAll8,
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: _arrowForwardIosIcon,
        onTap: onTap,
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _hbox5 = SizedBox(height: 5);
const _hbox20 = SizedBox(height: 20);
const _hbox30 = SizedBox(height: 30);

const _insetsSymmetricH8V8 = EdgeInsets.symmetric(horizontal: 8, vertical: 8);
const _insetsSymmetricH32V16 = EdgeInsets.symmetric(vertical: 16, horizontal: 32);
const _insetsAll8 = EdgeInsets.all(8);
const _insetsAll24 = EdgeInsets.all(24);

const _subtitleStyle = TextStyle(color: Colors.grey, fontSize: 12);
const _titleStyle = TextStyle(fontWeight: FontWeight.bold);
const _pageTitleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

const _arrowForwardIosIcon = Icon(Icons.arrow_forward_ios);
const _paypalIcon = Icon(FontAwesomeIcons.paypal, color: Colors.indigo);
const _googleWalletIcon = Icon(FontAwesomeIcons.googleWallet, color: Colors.indigo);
const _applePayIcon = Icon(FontAwesomeIcons.applePay, color: Colors.indigo);

final _circularShape10 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
