import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class SmartWalletOnboardingPage extends StatelessWidget {
  static final String path = "lib/src/pages/onboarding/smart_wallet_onboarding.dart";

  final logoImage = 'assets/smwallet/logo.png';

  final _items = <_Item>[
    _Item(
      title: 'Welcome to Smart Wallet',
      subtitle: 'Plan your finance, anytime, anywhere.',
      image: 'assets/smwallet/wallet1.png',
    ),
    _Item(
      title: 'One Touch Send Money',
      subtitle: 'Send money in just one touch and organize your wallet smart.',
      image: 'assets/smwallet/wallet2.png',
    ),
    _Item(
      title: 'Automatically Organize',
      subtitle: 'Organize your expenses and incomes and secure your wallet with pin.',
      image: 'assets/smwallet/wallet3.png',
    ),
  ];

  List<PageViewModel> get pages => _items.map((item) => _buildPage(item)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () => Navigator.pop(context),
              showSkipButton: false,
              doneText: Text("Get Started"),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: _s16RegularStyle,
            ),
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Image.asset(logoImage, width: 100),
            )
          ],
        ),
      ),
    );
  }

  PageViewModel _buildPage(_Item item) {
    return PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: [
          Text(item.title),
          Text(item.subtitle, style: _black54S16Style),
        ],
      ),
      mainImage: Image.asset(item.image, width: 285, alignment: Alignment.center),
      textStyle: _blackStyle,
    );
  }

  final _black54S16Style = TextStyle(color: Colors.black54, fontSize: 16);
  final _blackStyle = TextStyle(color: Colors.black);
  final _s16RegularStyle = TextStyle(fontSize: 16, fontFamily: "Regular");
}

class _Item {
  final String title;
  final String subtitle;
  final String image;
  _Item({this.title, this.subtitle, this.image});
}
