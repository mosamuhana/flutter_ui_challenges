import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets.dart';

class CakePage extends StatefulWidget {
  static final String path = "lib/src/pages/food/cake.dart";

  @override
  _CakePageState createState() => _CakePageState();
}

class _CakePageState extends State<CakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Fruits Cake",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),
              ),
              _hbox10,
              Text(
                "strawberry & kiwi special",
                style: TextStyle(color: _primaryColor, fontSize: 16),
              ),
              Container(
                height: 60,
                child: ListView(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _wbox20,
                    ChoiceChip(
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: Text(
                        "1 Kg",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: _backgroundColor,
                      selected: true,
                      onSelected: (val) {},
                      selectedColor: _primaryColor,
                    ),
                    _wbox20,
                    ChoiceChip(
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: Text(
                        "2 Kg",
                        style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: _backgroundColor,
                      selected: false,
                      onSelected: (val) {},
                      selectedColor: _primaryColor,
                    ),
                    _wbox20,
                    ChoiceChip(
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: Text(
                        "3 Kg",
                        style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: _backgroundColor,
                      selected: false,
                      onSelected: (val) {},
                      selectedColor: _primaryColor,
                    ),
                    _wbox20,
                    ChoiceChip(
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: Text(
                        "4 Kg",
                        style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: _backgroundColor,
                      selected: false,
                      onSelected: (val) {},
                      selectedColor: _primaryColor,
                    ),
                  ],
                ),
              ),
              _hbox20,
              Container(
                height: 180,
                child: Row(
                  children: [
                    Expanded(
                      child: PNetworkImage(_cakeImage),
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: () {},
                        ),
                        CircleAvatar(
                          child: Text("1"),
                          backgroundColor: _primaryColor,
                        ),
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    _wbox10,
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\$84.",
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "99",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              _hbox20,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: _overlayColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _hbox20,
                          PNetworkImage(_eggsImage),
                          _hbox10,
                          Text(
                            "4 Eggs",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _hbox10,
                          PNetworkImage(_vanillaImage),
                          _hbox10,
                          Text(
                            "2 tsp vanilla",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _hbox20,
                          PNetworkImage(_sugarImage),
                          _hbox10,
                          Text(
                            "1 cup sugar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _hbox20,
              Container(
                child: Row(
                  children: [
                    _wbox20,
                    PNetworkImage(_mapImage),
                    _wbox20,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DELIVERY",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "45, Amarlands",
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          Text(
                            "Nr. Hamer Road, London",
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _hbox10,
              Row(
                children: [
                  _wbox20,
                  Text(
                    "Ratings",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  _wbox20,
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star_half, color: Colors.yellow),
                  Text(
                    "(55)",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              _hbox20,
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                onPressed: () {},
                child: Text(
                  "Make order now",
                  style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1.50, fontWeight: FontWeight.normal),
                ),
                color: _primaryColor,
              ),
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
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        )
      ],
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const String _cakeImage = '$STORE_BASE_URL/food%2Fcake.png?alt=media';
const String _eggsImage = '$STORE_BASE_URL/food%2Feggs.png?alt=media';
const String _mapImage = '$STORE_BASE_URL/food%2Fmap.png?alt=media';
const String _sugarImage = '$STORE_BASE_URL/food%2Fsugar.png?alt=media';
const String _vanillaImage = '$STORE_BASE_URL/food%2Fvanilla.png?alt=media';

const _primaryColor = Color(0xff7b7517);
const _backgroundColor = Color(0xff2f2f4f);
const _overlayColor = Color(0xff212129);

const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _wbox10 = SizedBox(width: 10);
const _wbox20 = SizedBox(width: 20);
