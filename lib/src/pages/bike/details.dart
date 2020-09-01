import 'package:flutter/material.dart';

import '../../../core/widgets.dart';
import 'models.dart';

class DetailsPage extends StatefulWidget {
  static final String path = "lib/src/pages/bike/bike_details.dart";

  final Bike item;

  DetailsPage({Key key, @required this.item});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Bike get item => widget.item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _image,
                _content,
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

  Widget get _image {
    return Stack(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: CustomImage(item.image, fit: BoxFit.cover),
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
            labelStyle: _whiteBoldStyle,
            backgroundColor: Theme.of(context).primaryColor,
            label: Text('${item.price}'),
          ),
        ),
      ],
    );
  }

  Widget get _content {
    return Padding(
      padding: _insets16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _keySpecs,
          _hbox10,
          _freeGifts,
          _hbox10,
          _specifications,
        ],
      ),
    );
  }

  Widget get _freeGifts {
    return Padding(
      padding: _insetsL6B4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Free Gifts', style: Theme.of(context).textTheme.subtitle1),
          _hbox5,
          Text(item?.freeGifts?.join(', ') ?? '', softWrap: true),
        ],
      ),
    );
  }

  Widget get _keySpecs {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Key Specs', style: Theme.of(context).textTheme.headline6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildSpec(
                label: "Engine",
                value: item.engine,
                icon: Icon(Icons.apps),
              ),
              _buildSpec(
                label: "Mileage",
                value: item.mileage,
                icon: Icon(Icons.apps),
              ),
              _buildSpec(
                label: "Brakes",
                value: item.breaks,
                icon: Icon(Icons.apps),
              ),
              _buildSpec(
                label: "Fuel Tank",
                value: item.fuelTank,
                icon: Icon(Icons.apps),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _specifications {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Specification', style: Theme.of(context).textTheme.headline6),
        _buildSpecification('Manufactured Year', '2019'),
        _buildSpecification('Number (Lot)', 'Bagmati 80'),
        _buildSpecification('Category', 'Standard'),
        _buildSpecification('Engine Serviced?', 'Half'),
        _buildSpecification('Ground Clearance', '150 mm'),
        _buildSpecification('Seat height', '700 mm'),
      ],
    );
  }

  Widget _buildSpec({Widget icon, String label, String value}) {
    return Card(
      child: Padding(
        padding: _insets8,
        child: Column(
          children: [
            icon,
            _hbox2,
            Text(label, style: _greyStyle),
            _hbox5,
            Text(value, style: _boldStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecification(String name, String value) {
    return BorderedContainer(
      padding: _insets0,
      margin: _insetsV4,
      child: ListTile(
        title: Text(name),
        trailing: Text(value, style: _boldStyle),
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _hbox10 = SizedBox(height: 10);
  final _hbox30 = SizedBox(height: 30);
  final _hbox2 = SizedBox(height: 2);

  final _boldStyle = TextStyle(fontWeight: FontWeight.bold);
  final _greyStyle = TextStyle(color: Colors.grey.shade800);
  final _whiteBoldStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final _insets0 = EdgeInsets.all(0);
  final _insets8 = EdgeInsets.all(8);
  final _insets16 = EdgeInsets.all(16);
  final _insetsL6B4 = EdgeInsets.only(left: 6, bottom: 4);
  final _insetsV4 = EdgeInsets.symmetric(vertical: 4);
}
