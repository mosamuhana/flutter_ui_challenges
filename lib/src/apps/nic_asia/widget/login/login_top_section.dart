import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../util/constant.dart';

class LoginTopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 2.0,
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _hbox10,
          Container(
            child: Image.asset('assets/nicasiaassets/brand_alternate.png'),
          ),
          _hbox15,
          Container(
            height: deviceSize.height < 700 ? deviceSize.height * 0.19 : deviceSize.height * 0.18,
            child: GridView.count(
              crossAxisCount: 3,
              children: imageList
                  .map((item) => Column(
                        children: <Widget>[
                          Image.asset('$path${item['name']}.png', height: 50.0),
                          _hbox10,
                          Text(
                            item['title'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  final _hbox10 = SizedBox(height: 10);
  final _hbox15 = SizedBox(height: 15);
}
