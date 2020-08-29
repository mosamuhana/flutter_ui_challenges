import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets.dart';

class CheckoutPage extends StatefulWidget {
  static final String path = "lib/src/pages/ecommerce/checkout/page.dart";

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
            Text("Choose your plan", style: _boldS24Style),
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
          _buildPlanOffer(
            title: 'Free',
            subtitle: '7 days',
            active: selectedIndex == 0,
            onTap: () => setState(() => selectedIndex = 0),
          ),
          _buildPlanOffer(
            title: '\$450',
            subtitle: 'Per week',
            active: selectedIndex == 1,
            onTap: () => setState(() => selectedIndex = 1),
          ),
        ],
      ),
      Row(
        children: [
          _buildPlanOffer(
            title: '\$900',
            subtitle: 'Per month',
            active: selectedIndex == 2,
            onTap: () => setState(() => selectedIndex = 2),
          ),
          _buildPlanOffer(
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
      _buildPaymentMethod(
        title: 'Paypal',
        icon: _paypalIcon,
        onTap: () => print('Paypal'),
      ),
      _buildPaymentMethod(
        title: 'Google Pay',
        icon: _googleWalletIcon,
        onTap: () => print('Google Pay'),
      ),
      _buildPaymentMethod(
        title: 'Apple Pay',
        icon: _applePayIcon,
        onTap: () => print('Apple Pay'),
      ),
    ];
  }

  Widget get _continueButton {
    return Container(
      width: double.infinity,
      padding: _insetsH32V16,
      child: RaisedButton(
        elevation: 0,
        padding: _insets24,
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

  Widget _buildPaymentMethod({String title, Widget icon, VoidCallback onTap}) {
    return RoundedContainer(
      margin: _insets8,
      padding: _insets8,
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: _arrowForwardIosIcon,
        onTap: onTap,
      ),
    );
  }

  Widget _buildPlanOffer({String title, String subtitle, VoidCallback onTap, bool active}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: RoundedContainer(
          color: !active ? null : Colors.indigo,
          margin: _insetsH8V8,
          child: Column(
            children: [
              Text(
                title,
                style: !active ? _boldStyle : _boldStyle.copyWith(color: Colors.white),
              ),
              _hbox5,
              Text(
                subtitle,
                style: !active ? _greyS12Style : _greyS12Style.copyWith(color: Colors.white60),
              )
            ],
          ),
        ),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);

  final _insetsH8V8 = EdgeInsets.symmetric(horizontal: 8, vertical: 8);
  final _insetsH32V16 = EdgeInsets.symmetric(vertical: 16, horizontal: 32);
  final _insets8 = EdgeInsets.all(8);
  final _insets24 = EdgeInsets.all(24);

  final _greyS12Style = TextStyle(color: Colors.grey, fontSize: 12);
  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);
  final _boldS24Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  final _arrowForwardIosIcon = Icon(Icons.arrow_forward_ios);
  final _paypalIcon = Icon(FontAwesomeIcons.paypal, color: Colors.indigo);
  final _googleWalletIcon = Icon(FontAwesomeIcons.googleWallet, color: Colors.indigo);
  final _applePayIcon = Icon(FontAwesomeIcons.applePay, color: Colors.indigo);

  final _circularShape10 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
}
