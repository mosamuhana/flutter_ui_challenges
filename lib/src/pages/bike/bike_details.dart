import 'package:flutter/material.dart';

import '../../../core/widgets.dart';
import 'bike.dart';
import 'widgets/specs_block.dart';

const _hbox5 = SizedBox(height: 5);
const _hbox10 = SizedBox(height: 10);
const _hbox30 = SizedBox(height: 30);

// ignore: non_constant_identifier_names
const _boldStyle = TextStyle(fontWeight: FontWeight.bold);
const _priceStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

const _padding_all0 = EdgeInsets.all(0);
const _padding_all16 = EdgeInsets.all(16);
const _padding_l6_b4 = EdgeInsets.only(left: 6, bottom: 4);
const _padding_v4 = EdgeInsets.symmetric(vertical: 4);

class BikeDetailsPage extends StatefulWidget {
  static final String path = "lib/src/pages/bike/bike_details.dart";

  @override
  _BikeDetailsPageState createState() => _BikeDetailsPageState();
}

class _BikeDetailsPageState extends State<BikeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bike_data.name), elevation: 0),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bikeImage,
                Padding(
                  padding: _padding_all16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headline('Key Specs'),
                      _keySpecs,
                      _hbox10,
                      _subtitle('Free Gifts'),
                      _hbox5,
                      _freeGifts,
                      _hbox10,
                      _headline('Specification'),
                      ..._specificationInfo,
                    ],
                  ),
                ),
                _hbox30,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton.icon(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              icon: Icon(Icons.message),
              label: Text("Message Seller"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _headline(String title) {
    return Padding(
      padding: _padding_l6_b4,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _subtitle(String title) {
    return Padding(
      padding: _padding_l6_b4,
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget get _bikeImage {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: PNetworkImage(bike_data.image, fit: BoxFit.cover),
        ),
        Positioned(
          left: 20,
          bottom: 10,
          child: Rating(value: 4),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: Chip(
            elevation: 0,
            labelStyle: _priceStyle,
            backgroundColor: Theme.of(context).primaryColor,
            label: Text(bike_data.price),
          ),
        ),
      ],
    );
  }

  Widget get _freeGifts {
    return Padding(
      padding: _padding_l6_b4,
      child: Text(bike_data?.freeGifts?.join(', ') ?? ''),
    );
  }

  Widget get _keySpecs {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SpecsBlock(
            label: "Engine",
            value: bike_data.engine,
            icon: Icon(Icons.apps),
          ),
          SpecsBlock(
            label: "Mileage",
            value: bike_data.mileage,
            icon: Icon(Icons.apps),
          ),
          SpecsBlock(
            label: "Brakes",
            value: bike_data.breaks,
            icon: Icon(Icons.apps),
          ),
          SpecsBlock(
            label: "Fuel Tank",
            value: bike_data.fuelTank,
            icon: Icon(Icons.apps),
          ),
        ],
      ),
    );
  }

  List<Widget> get _specificationInfo {
    return [
      BorderedContainer(
        padding: _padding_all0,
        margin: _padding_v4,
        child: ListTile(
          title: Text("Manufactured Year"),
          trailing: Text("2019", style: _boldStyle),
        ),
      ),
      BorderedContainer(
        padding: _padding_all0,
        margin: _padding_v4,
        child: ListTile(
          title: Text("Number (Lot)"),
          trailing: Text("Bagmati 80", style: _boldStyle),
        ),
      ),
      BorderedContainer(
        padding: _padding_all0,
        margin: _padding_v4,
        child: ListTile(
          title: Text("Category"),
          trailing: Text("Standard", style: _boldStyle),
        ),
      ),
      BorderedContainer(
        padding: _padding_all0,
        margin: _padding_v4,
        child: ListTile(
          title: Text("Engine Serviced?"),
          trailing: Text("Half", style: _boldStyle),
        ),
      ),
      BorderedContainer(
        padding: _padding_all0,
        margin: _padding_v4,
        child: ListTile(
          title: Text("Ground Clearance"),
          trailing: Text("150 mm", style: _boldStyle),
        ),
      ),
      BorderedContainer(
        margin: _padding_v4,
        padding: _padding_all0,
        child: ListTile(
          title: Text("Seat height"),
          trailing: Text("700 mm", style: _boldStyle),
        ),
      ),
    ];
  }
}
