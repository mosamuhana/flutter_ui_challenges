import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets.dart';

class EcommerceDetail3Page extends StatelessWidget {
  static final String path = "lib/src/pages/ecommerce/ecommerce_detail3/page.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backImage,
          SafeArea(
            child: Column(
              children: [
                _backButton(context),
                _spacer,
                Expanded(
                  child: Container(
                    decoration: _circularDecoration20,
                    child: Column(
                      children: [
                        _hbox30,
                        _contentCard,
                        _bottomCard,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _backImage {
    return Container(
      height: double.infinity,
      child: PNetworkImage(_backImageUrl, fit: BoxFit.cover),
    );
  }

  Widget get _contentCard {
    final desc = "Hand-stitched finish. Flexible pebble sole. Made of brown leather with a textured effect";
    final details = "This is the details widget. Here you can see more details of the product";

    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Docside", style: _blackBold28Style),
              trailing: IconButton(
                icon: _favoriteBorderIcon,
                onPressed: () {},
              ),
            ),
            Padding(
              padding: _insetsSymmetricH16V8,
              child: Text(desc, style: _greyStyle),
            ),
            ExpansionTile(
              title: Text("Show Details", style: _blackBoldStyle),
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: _insetsAll16,
                  child: Text(details),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _bottomCard {
    return Container(
      padding: _insetsAll32,
      decoration: _bottomCardDecoration,
      child: Row(
        children: [
          Text("\$35.99", style: _whiteBold18Style),
          _wbox20,
          _spacer,
          RaisedButton(
            padding: _insetsSymmetricH16V8,
            shape: _circularShape10,
            onPressed: () {},
            color: Colors.orange,
            textColor: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add to Cart", style: _bold16Style),
                _wbox20,
                Container(
                  padding: _insetsAll8,
                  child: _arrowForwardIosIcon,
                  decoration: _circularDecoration10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Padding(
      padding: _insetsAll8,
      child: Row(
        children: [
          MaterialButton(
            padding: _insetsAll8,
            shape: _circularShape10,
            child: _arrowBackIosIcon,
            color: Colors.white,
            textColor: Colors.black,
            minWidth: 0,
            height: 40,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Private Static Contents ----------------------------------------------------------
// ----------------------------------------------------------------------------------

const _backImageUrl = '$STORE_BASE_URL/img%2F2.jpg?alt=media';

const _blackBoldStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
final _blackBold28Style = _blackBoldStyle.copyWith(fontSize: 28);
final _greyStyle = TextStyle(color: Colors.grey.shade600);
const _whiteBold18Style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
const _bold16Style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

const _spacer = Spacer();

const _insetsAll8 = EdgeInsets.all(8);
const _insetsAll16 = EdgeInsets.all(16);
const _insetsAll32 = EdgeInsets.all(32);
const _insetsSymmetricH16V8 = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

const _arrowBackIosIcon = Icon(Icons.arrow_back_ios);
const _arrowForwardIosIcon = Icon(Icons.arrow_forward_ios, color: Colors.orange, size: 16);
const _favoriteBorderIcon = Icon(Icons.favorite_border);

final _circularShape10 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

final _circularDecoration10 = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10));
final _circularDecoration20 = BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20));

final _bottomCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
  color: Colors.grey.shade900,
);

const _hbox30 = SizedBox(height: 30);
const _wbox20 = SizedBox(width: 20);
