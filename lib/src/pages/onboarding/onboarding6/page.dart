import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class Onboarding6Page extends StatelessWidget {
  static final String path = "lib/src/pages/onboarding/onboarding6/page.dart";

  final backgroundImage = photographer;
  final cardImage = ledge;
  final cardTitle = 'How will you do?';
  final cardDescription =
      'Lorem ipsuim is simply dummy text of the \nprinting and typesetting industry.\nLorem ipsum has been the';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: PNetworkImage(backgroundImage, fit: BoxFit.contain),
          ),
          Column(
            children: [
              _hbox30,
              _card,
              _getStartedButton,
              _hbox40,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _getStartedButton {
    return Container(
      padding: _insetsH80,
      width: double.infinity,
      child: RaisedButton(
        padding: _insets16,
        textColor: Colors.white,
        color: Colors.lightGreen,
        shape: _getStartedButtonShape,
        onPressed: () {},
        child: Text("Get Started", style: _w300S18Style),
      ),
    );
  }

  Widget get _card {
    return Expanded(
      child: Container(
        decoration: _cardDecoration,
        margin: _insets48,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(cardImage), fit: BoxFit.cover),
                  borderRadius: _circularTopBorder10,
                ),
              ),
            ),
            _hbox20,
            Text(cardTitle, style: _greyS24Style),
            _hbox10,
            Text(cardDescription, textAlign: TextAlign.center, style: _greyS14Style),
            _hbox30,
          ],
        ),
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _hbox30 = SizedBox(height: 30);
  final _hbox40 = SizedBox(height: 40);

  final _insets16 = EdgeInsets.all(16);
  final _insets48 = EdgeInsets.all(48);
  final _insetsH80 = EdgeInsets.symmetric(horizontal: 80);

  final _greyS14Style = TextStyle(color: Colors.grey.shade400, fontSize: 14);
  final _greyS24Style = TextStyle(color: Colors.grey.shade700, fontSize: 24);
  final _w300S18Style = TextStyle(fontWeight: FontWeight.w300, fontSize: 18);

  final _getStartedButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(40));

  final _cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(color: Colors.black38, offset: Offset(5, 5), blurRadius: 5),
    ],
  );

  final _circularTopBorder10 = BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
}

const String photographer = '$STORE_BASE_URL/img%2Fphotographer.jpg?alt=media';
const String ledge = '$STORE_BASE_URL/img%2Fledge.jpg?alt=media';
