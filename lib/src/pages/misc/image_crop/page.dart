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
  final imagePath = 'assets/placeholder.jpg';
  final originalAspectRatio = 1920 / 1280.0; // 1000 / 667.0;
  CropController controller;

  CropShape _shape = CropShape.box;
  SliderThemeData _sliderThemeData;

  @override
  void initState() {
    controller = CropController(
      aspectRatio: originalAspectRatio,
      rotation: 0,
      scale: 1,
    );
    super.initState();
  }

  SliderThemeData get sliderThemeData {
    if (_sliderThemeData == null) {
      _sliderThemeData = Theme.of(context).sliderTheme.copyWith(trackShape: CenteredRectangularSliderTrackShape());
    }
    return _sliderThemeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Demo'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _onCrop,
            tooltip: 'Crop',
            icon: _cropIcon,
          )
        ],
      ),
      body: Column(
        children: [
          _imageCropper,
          _bottomBar,
        ],
      ),
    );
  }

  Widget get _imageCropper {
    return Expanded(
      child: Container(
        color: Colors.black,
        padding: _insets8,
        child: Crop(
          onChanged: (x) => _debugDecomposition(x),
          controller: controller,
          shape: _shape,
          child: Image.asset(imagePath, fit: BoxFit.cover),
          foreground: IgnorePointer(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text('Foreground Object', style: _redStyle),
            ),
          ),
          helper: _shape == CropShape.box ? _boxContainer : null,
        ),
      ),
    );
  }

  Widget get _bottomBar {
    return Row(
      children: [
        IconButton(
          icon: _undoIcon,
          tooltip: 'Undo',
          onPressed: _onUndo,
        ),
        _slider,
        _shapeButton,
        _aspectRatioButton,
      ],
    );
  }

  Widget get _aspectRatioButton {
    return PopupMenuButton<double>(
      icon: _aspectRatioIcon,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Original"),
          value: originalAspectRatio,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("16:9"),
          value: 16.0 / 9.0,
        ),
        PopupMenuItem(
          child: Text("4:3"),
          value: 4.0 / 3.0,
        ),
        PopupMenuItem(
          child: Text("1:1"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("3:4"),
          value: 3.0 / 4.0,
        ),
        PopupMenuItem(
          child: Text("9:16"),
          value: 9.0 / 16.0,
        ),
      ],
      tooltip: 'Aspect Ratio',
      onSelected: _onAspectRatioChanged,
    );
  }

  Widget get _shapeButton {
    return PopupMenuButton<CropShape>(
      icon: _cropFreeIcon,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Box"),
          value: CropShape.box,
        ),
        PopupMenuItem(
          child: Text("Oval"),
          value: CropShape.oval,
        ),
      ],
      tooltip: 'Crop Shape',
      onSelected: _onShapeChanged,
    );
  }

  Widget get _slider {
    return Expanded(
      child: SliderTheme(
        data: sliderThemeData,
        child: Slider(
          divisions: 361,
          value: controller.rotation,
          min: -180,
          max: 180,
          label: '${controller.rotation}°',
          onChanged: _onRotationChanged,
        ),
      ),
    );
  }

  void _onUndo() {
    controller.rotation = 0;
    controller.scale = 1;
    controller.offset = Offset.zero;
  }

  void _onCrop() async {
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final croppedImage = await controller.crop(pixelRatio: pixelRatio);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CropResultPage(image: croppedImage),
        fullscreenDialog: true,
      ),
    );
  }

  void _onRotationChanged(double rotation) {
    controller.rotation = rotation.roundToDouble();
  }

  void _onShapeChanged(CropShape shape) {
    _shape = shape;
    setState(() {});
  }

  void _onAspectRatioChanged(double aspectRatio) {
    controller.aspectRatio = aspectRatio;
  }

  final _redStyle = TextStyle(color: Colors.red);
  final _insets8 = EdgeInsets.all(8);
  final _aspectRatioIcon = Icon(Icons.aspect_ratio);
  final _cropIcon = Icon(Icons.crop);
  final _undoIcon = Icon(Icons.undo);
  final _cropFreeIcon = Icon(Icons.crop_free);
  final _boxContainer = Container(decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2)));
}

void _debugDecomposition(MatrixDecomposition decomposition) {
  print("Scale : ${decomposition.scale}, Rotation: ${decomposition.rotation}, translation: ${decomposition.translation}");
}
