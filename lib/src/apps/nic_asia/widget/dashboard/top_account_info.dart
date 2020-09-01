import 'package:flutter/material.dart';

import '../../util/constant.dart';
import '../../widget/profile_image.dart';

class TopAccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        //horizontal: deviceSize.width * 0.03,
        vertical: deviceSize.height * 0.02,
      ),
      child: Container(
        alignment: Alignment.center,
        height: deviceSize.height * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileImage(),
                buildAcountDetail,
              ],
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget get buildAcountDetail {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('sammunati bachat khata'.toUpperCase(), style: _blackW600S15Style),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('NPR.', style: _primaryW500S17Style),
              _wbox3,
              Text('1,00,999.35', style: _primaryBoldS20Style),
              _wbox10,
              Icon(Icons.remove_red_eye, color: Colors.teal.shade200, size: 20)
            ],
          ),
          Text('281656484161548651', style: _blackW600S15Style),
        ],
      ),
    );
  }

  final _wbox3 = SizedBox(width: 3);
  final _wbox10 = SizedBox(width: 10);
  final _blackW600S15Style = TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600);
  final _primaryW500S17Style = TextStyle(fontSize: 17, color: primaryColorLight, fontWeight: FontWeight.w500);
  final _primaryBoldS20Style = TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.bold);
}
