import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bike_details.dart';
import 'widgets/bike_list_item.dart';
import 'widgets/category_chooser.dart';

const _hbox16 = SizedBox(height: 16);
const _hbox10 = SizedBox(height: 10);
const _hbox20 = SizedBox(height: 20);
const _wbox10 = SizedBox(width: 10);
const _wbox20 = SizedBox(width: 20);

const _padding_l16_t16 = EdgeInsets.only(left: 16, top: 16);
const _padding_h16 = EdgeInsets.symmetric(horizontal: 16);

final _circularBorder4 = BorderRadius.circular(4);

const _whiteBold20Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
const _whiteSemiBold18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

const _moneyBillIcon = Icon(FontAwesomeIcons.moneyBill, size: 30);

class BikeHomePage extends StatelessWidget {
  static final String path = "lib/src/pages/bike/home_page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bikes')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _padding_l16_t16,
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
              padding: _padding_h16,
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
      padding: _padding_h16,
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
                        Text("All in one place", style: _whiteSemiBold18Style),
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
      padding: _padding_h16,
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
}
