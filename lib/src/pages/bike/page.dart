import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bike_details.dart';
import 'bike_list_item.dart';
import 'category_chooser.dart';

class BikeHomePage extends StatelessWidget {
  static final String path = "lib/src/pages/bike/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bikes')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _insetsL16T16,
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            CategoryChooser(
              onTap: (category) => Navigator.pushNamed(context, 'category_bikes', arguments: category),
            ),
            _hbox10,
            _swiper,
            _hbox16,
            Padding(
              padding: _insetsH16,
              child: Row(
                children: [
                  Text(
                    "Recent Posts",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(),
                  FlatButton(
                    child: Text("View all"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            _posts(context),
            _hbox20,
          ],
        ),
      ),
    );
  }

  Widget get _swiper {
    return Padding(
      padding: _insetsH16,
      child: Card(
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: _circularBorder4,
            color: Colors.indigo,
          ),
          child: Swiper(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  _wbox20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Buy, Sell, Exchange", style: _whiteBold20Style),
                        Text("All in one place", style: _whiteW500S18Style),
                      ],
                    ),
                  ),
                  _wbox10,
                  CircleAvatar(
                    backgroundColor: Colors.indigo.shade800,
                    radius: 50,
                    child: _moneyBillIcon,
                  ),
                  _wbox20,
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _posts(BuildContext context) {
    return Padding(
      padding: _insetsH16,
      child: Column(
        children: [
          BikeListItem(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BikeDetailsPage())),
          ),
          BikeListItem(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BikeDetailsPage())),
          ),
          BikeListItem(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BikeDetailsPage())),
          ),
          BikeListItem(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BikeDetailsPage())),
          ),
        ],
      ),
    );
  }

  final _hbox16 = SizedBox(height: 16);
  final _hbox10 = SizedBox(height: 10);
  final _hbox20 = SizedBox(height: 20);
  final _wbox10 = SizedBox(width: 10);
  final _wbox20 = SizedBox(width: 20);

  final _insetsL16T16 = EdgeInsets.only(left: 16, top: 16);
  final _insetsH16 = EdgeInsets.symmetric(horizontal: 16);

  final _circularBorder4 = BorderRadius.circular(4);

  final _whiteBold20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  final _whiteW500S18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

  final _moneyBillIcon = Icon(FontAwesomeIcons.moneyBill, size: 30);
}
