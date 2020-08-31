import 'package:flutter/material.dart';
import 'package:crop/crop.dart';

import 'centered_rectangular_slider_track_shape.dart';
import 'crop_result_page.dart';

class ImageCropPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/image_crop/page.dart";

  @override
  _ImageCropPageState createState() => _ImageCropPageState();
}

class _ImageCropPageState extends State<ImageCropPage> {
  final _cropKey = GlobalKey<CropState>();
  double _rotation = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Demo'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _cropImage,
            tooltip: 'Crop',
            icon: Icon(Icons.crop),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Crop(
              key: _cropKey,
              child: Image.asset('assets/placeholder.jpg'),
              aspectRatio: 1920 / 1280.0,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.undo),
                tooltip: 'Undo',
                onPressed: () {
                  _cropKey.currentState.rotation = 0;
                  _cropKey.currentState.scale = 1;
                  _cropKey.currentState.offset = Offset.zero;
                  _rotation = 0;
                  setState(() {});
                },
              ),
              Expanded(
                child: SliderTheme(
                  data: theme.sliderTheme.copyWith(trackShape: CenteredRectangularSliderTrackShape()),
                  child: Slider(
                    divisions: 91,
                    value: _rotation,
                    min: -45,
                    max: 45,
                    label: '$_rotation°',
                    onChanged: (n) {
                      _rotation = n.roundToDouble();
                      _cropKey.currentState.rotation = _rotation;
                      setState(() {});
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.aspect_ratio),
                tooltip: 'Aspect Ratio',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _cropImage() async {
    final cropped = await _cropKey.currentState.crop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CropResultPage(image: cropped),
        fullscreenDialog: true,
      ),
    );
  }
}
