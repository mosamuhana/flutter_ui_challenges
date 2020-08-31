import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/widgets.dart';
import '../models.dart';
import '../data.dart';

class TravelDestinationDetailPage extends StatefulWidget {
  static final String path = "lib/src/pages/travel/travel_destination_detail/page.dart";

  @override
  _TravelDestinationDetailPageState createState() => _TravelDestinationDetailPageState();
}

class _TravelDestinationDetailPageState extends State<TravelDestinationDetailPage> {
  List<Place> places;
  List<String> images;
  int placeIndex = 0;
  int imageIndex = 0;

  Place get currentPlace => places[placeIndex];

  @override
  void initState() {
    places = getPlaces();
    images = getDistinationImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _headerImage,
          ListView(
            padding: _insetsH20,
            children: [
              _cityCard,
              _topRow,
              _horizontalimageList,
              _imageGrid,
            ],
          ),
        ],
      ),
    );
  }

  Widget get _headerImage {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(currentPlace.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget get _cityCard {
    return Container(
      padding: _insetsL40T200,
      child: Card(
        elevation: 5,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: _arrowBackIcon,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(currentPlace.title, style: _boldS20Style),
                  _spacer,
                  IconButton(
                    icon: _starBorderIcon,
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                padding: _insetsL20T0R20B16,
                child: Text(
                  currentPlace.description,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _topRow {
    return Row(
      children: [
        Expanded(child: Text("Places to visit")),
        FlatButton(
          textColor: Colors.red,
          onPressed: () {},
          child: Text("See All"),
        ),
      ],
    );
  }

  Widget get _horizontalimageList {
    final list = <Widget>[];
    for (var i = 0; i < places.length; i++) {
      if (i > 0) list.add(_wbox20);
      list.add(
        InkWell(
          onTap: () => setState(() => placeIndex = i),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: _circularBorder5,
                child: PNetworkImage(places[i].image, height: 80, fit: BoxFit.cover),
              ),
              _hbox5,
              Text(places[i].title),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: list,
      ),
    );
  }

  Widget get _imageGrid {
    return Container(
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: _circularBorder5,
              child: PNetworkImage(
                images[imageIndex],
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _wbox20,
          Expanded(
            child: GridView(
              shrinkWrap: true,
              gridDelegate: _gridDelegate,
              children: List.generate(images.length, (i) {
                return InkWell(
                  onTap: () => setState(() => imageIndex = i),
                  child: ClipRRect(
                    borderRadius: _circularBorder5,
                    child: PNetworkImage(images[i], fit: BoxFit.cover),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  final _hbox5 = SizedBox(height: 5);
  final _wbox20 = SizedBox(width: 20);

  final _circularBorder5 = BorderRadius.circular(5);

  final _spacer = Spacer();

  final _boldS20Style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  final _insetsL40T200 = EdgeInsets.only(top: 200, left: 40);
  final _insetsH20 = EdgeInsets.symmetric(horizontal: 20);
  final _insetsL20T0R20B16 = EdgeInsets.fromLTRB(20, 0, 20, 16);

  final _arrowBackIcon = Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back);
  final _starBorderIcon = Icon(Icons.star_border);

  final _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );
}
